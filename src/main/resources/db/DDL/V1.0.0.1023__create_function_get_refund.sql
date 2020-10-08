CREATE OR REPLACE FUNCTION apx.get_refund(p_event_id character varying)
 RETURNS apx.refund_info
 LANGUAGE plpgsql
AS $function$
declare

v_event_created_at 	TIMESTAMPTZ(3);
v_from_date_time 	TIMESTAMPTZ(3);
v_to_date_time 	TIMESTAMPTZ(3);

evtcur CURSOR(c_event_id VARCHAR(50)) FOR
SELECT e.event_id,
e.event_type,
e.status_cd,
e.processing_state,
e.created_at								 
FROM apx.events e
WHERE e.event_id = c_event_id
and e.event_type='REFUND'
and e.created_at between v_from_date_time and v_to_date_time
and e.status_cd !='FAILED';
								 
l_event_id 		VARCHAR(50);
l_event_date 	TIMESTAMPTZ(3);
l_txn_id 		VARCHAR(50);
l_capture_id	VARCHAR(50);
							 
txncur CURSOR(c_event_id VARCHAR(50), c_event_date TIMESTAMPTZ(3)) FOR
SELECT
refund.refund_id,	
refund.amount 		 as refund_amt,															   
refund.account_id, 
refund.org_id,	
refund.psp_id,	
refund.routing_cd 	 as routing_cd,
refund.routing_type_cd  as routing_type_cd,	
refund.curcy_cd 	 as currency,
refund.merchant_ref  as merchant_ref,
refund.psp_txn_ref 	 as psp_ref													   
FROM apx.refund  															   
WHERE refund.refund_id = c_event_id 
AND   refund.created_at = c_event_date;		
															   													  							 
relcur CURSOR(c_event_id VARCHAR(50), c_event_date TIMESTAMPTZ(3)) FOR
select rel.event_id event_id ,rel.created_at created_at,rel.rel_type_cd
from apx.event_rel rel 
where rel.rel_event_id = c_event_id 
and rel.rel_type_cd = 'REFUND_CANCEL'															   
and rel.created_at between c_event_date and (current_date + interval '1 days' )
and rel.status_cd !='FAILED';
		
		
rel_capture CURSOR(c_refun_id VARCHAR(50), c_event_date TIMESTAMPTZ(3)) FOR
select rel_event_id, root_event_id
from apx.event_rel rel 
where rel.event_id = c_refun_id 
and rel.rel_type_cd = 'REFUND'
and rel.created_at = c_event_date 
and rel.status_cd !='FAILED';

		
l_rel_event_id 	VARCHAR(50);
l_rel_created_at 	TIMESTAMPTZ(3);
l_cancel_amt        DECIMAL;	
txnrec apx.refund_info;	

txnInfo apx.txn_info;	
								 
begin
	
	v_event_created_at :=apx.extract_date_from_id(p_event_id);

   if(v_event_created_at is null) then
     v_from_date_time :=(current_date - interval '15 months' ) ;
     v_to_date_time :=(current_date + interval '1 days' ) ;
    else  
       v_from_date_time :=v_event_created_at ;
       v_to_date_time :=(v_event_created_at + interval '1 days' ) ;
   end if;
	
	
	OPEN evtcur(p_event_id);
	FETCH evtcur INTO txnrec.event_id,txnrec.event_type,txnrec.status_cd,txnrec.processing_state,txnrec.created_at;
	l_event_id   := txnrec.event_id;	
	l_event_date := txnrec.created_at;
	CLOSE evtcur;													   
	IF l_event_id IS NULL THEN
	   RETURN txnrec;
	END IF;	
	
	OPEN txncur(l_event_id,l_event_date);
	FETCH txncur INTO l_txn_id,txnrec.refund_amount,txnrec.account_id, txnrec.org_id,txnrec.psp_id ,txnrec.routing_cd,txnrec.routing_type_cd,txnrec.currency,txnrec.merchant_ref,txnrec.psp_ref;	
	CLOSE txncur;
	IF l_txn_id IS NULL THEN
		RETURN txnrec;
	END IF;	
	FOR rel IN relcur(l_event_id,l_event_date) LOOP											   
		select cancel.amount INTO txnrec.refund_cancel_amt
		from apx.cancel cancel
		where cancel.cancel_id = rel.event_id
		and	cancel.created_at  = rel.created_at	;	
		IF l_cancel_amt IS NOT NULL THEN
			 txnrec.refund_cancel_amt = coalesce(txnrec.refund_cancel_amt,0) +	l_cancel_amt;
		END IF;
			  
	END LOOP;
	
	-- Fetch transactionId
	OPEN rel_capture(p_event_id, l_event_date); 
	FETCH rel_capture INTO txnrec.capture_id, txnrec.txn_id;
	CLOSE rel_capture;
	
	select sum(capture.amount) INTO txnrec.refund_cap_amt
	from apx.capture capture
	where (capture.capture_id,capture.created_at) 
	= ( select rel_event_id, rel_event_ceated_at  from apx.event_rel rel where rel.event_id = l_txn_id and rel.rel_type_cd='REFUND' and rel.created_at = l_event_date
         and rel.status_cd !='FAILED');
	 			
	-- Fetch transaction information			
	txnInfo = apx.get_txn(txnrec.txn_id);

	txnrec.txn_created_at := txnInfo.created_at;
	txnrec.txn_amount := txnInfo.txn_amount;
	txnrec.txn_status_cd := txnInfo.status_cd;
	txnrec.txn_capture_amt := txnInfo.txn_capture_amt;
	txnrec.txn_capture_count := txnInfo.txn_capture_count;
	txnrec.txn_cap_cancel_amt := txnInfo.txn_cap_cancel_amt;
	txnrec.txn_cap_refund_amt := txnInfo.txn_cap_refund_amt;
	txnrec.txn_cap_ref_cancel_amt := txnInfo.txn_cap_ref_cancel_amt;
				
	RETURN txnrec;												   
END;
$function$
;
