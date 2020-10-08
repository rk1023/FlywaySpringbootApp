CREATE OR REPLACE FUNCTION apx.get_txn(p_event_id character varying)
 RETURNS apx.txn_info
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
and e.event_type in('ORIG_TXN','CREDIT_TXN')
and e.created_at between v_from_date_time  and v_to_date_time
and status_cd !='FAILED';
								 
v_event_id 		VARCHAR(50);
v_event_date 	TIMESTAMPTZ(3);
v_txn_id 		VARCHAR(50);
v_capture_id	VARCHAR(50);
cap_created_at  TIMESTAMPTZ(3);
						 
txncur CURSOR(c_event_id VARCHAR(50), c_event_date TIMESTAMPTZ(3)) FOR
SELECT
txn.txn_id,														   
txn.amount as txn_amt,
txn.account_id, 
txn.org_id ,
txn.txn_type_cd as txn_type,
txn.three_ds_version as txn_three_ds,
txn.routing_cd as txn_routing_cd,
txn.routing_type_cd as txn_routing_type_cd,
txn.dynamic_descriptor as txn_dynamic_desc,
txn.curcy_cd as txn_currency,
txn.merchant_ref as txn_merchant_ref,
txn.psp_txn_ref as txn_psp_ref,
txn.party_rel_id as txn_party_rel_id,
txn.user_agent as txn_user_agent,
txn.psp_id as txn_psp_id
FROM apx.txn txn															   
WHERE txn.txn_id = c_event_id 
AND   txn.created_at = c_event_date;														   


relcur CURSOR(c_event_id VARCHAR(50), c_event_date TIMESTAMPTZ(3)) FOR
select event_id, rel.rel_type_cd, rel.created_at created_at
from apx.event_rel rel 
where 
rel.root_event_id = c_event_id
and rel.created_at between c_event_date  and (current_date + interval '1 days' ) 
and status_cd !='FAILED'
limit 100;


v_txn_created_at TIMESTAMPTZ(3);
v_child_event_id 	VARCHAR(50);
v_rel_type_cd VARCHAR(50);
v_rel_created_at 	TIMESTAMPTZ(3);
amt numeric := 0;	
txnrec apx.txn_info;	

v_temp_txn_cancel_amt DECIMAL := 0;
v_temp_txn_capture_amt numeric := 0;
v_temp_txn_cap_cancel_amt  DECIMAL := 0;
v_temp_txn_cap_refund_amt  DECIMAL := 0;
v_temp_txn_cap_ref_cancel_amt DECIMAL :=0;
v_temp_amt DECIMAL :=0;


v_total_txn_cancel_amt DECIMAL := 0;
v_total_txn_capture_amt DECIMAL := 0;
v_capture_count numeric := 0;
v_txn_cap_cancel_amt  DECIMAL := 0;
v_txn_cap_refund_amt  DECIMAL := 0;
v_txn_cap_ref_cancel_amt DECIMAL :=0;


														 
begin
	
	v_event_created_at :=apx.extract_date_from_id(p_event_id);

   if(v_event_created_at is null) then
     v_from_date_time :=(current_date - interval '15 months' ) ;
     v_to_date_time :=(current_date + interval '1 days' ) ;
    else  
       v_from_date_time :=v_event_created_at ;
       v_to_date_time :=(v_event_created_at + interval '1 days' ) ;
   end if;
	
--  query1:  Open cursor on Events table for given event_id

	OPEN evtcur(p_event_id);
	FETCH evtcur INTO txnrec.event_id,txnrec.event_type,txnrec.status_cd,txnrec.processing_state,v_event_date;
	v_event_id := txnrec.event_id;		
    txnrec.txn_dynamic_desc :=v_event_id;
    v_txn_created_at :=v_event_date;
	CLOSE evtcur;


	
-- if given input evenet_id is not valid then return 
	IF v_event_id IS NULL THEN
	   RETURN txnrec;
	END IF;	
	
	  txnrec.created_at :=v_txn_created_at;
	  
--  query2: fetch data from txn table for given event_id(txn_id)
	OPEN txncur(v_event_id,v_event_date);
	FETCH txncur INTO v_txn_id,txnrec.txn_amount,txnrec.account_id, txnrec.org_id,
          txnrec.txn_type,txnrec.txn_three_ds,txnrec.txn_routing_cd,txnrec.txn_routing_type_cd,
          txnrec.txn_dynamic_desc,txnrec.txn_currency,txnrec.txn_merchant_ref,txnrec.txn_psp_ref,
          txnrec.txn_party_rel_id,txnrec.txn_user_agent ,txnrec.txn_psp_id ;
	CLOSE txncur;


-- if given event_id id not a valid txn_id then return 	
	IF v_txn_id IS NULL THEN
		RETURN txnrec;
	END IF;	


-- query3: fetch all child events (cancel , capture ) for given txn_id 

	OPEN relcur(v_event_id,v_event_date); 


   		loop
			FETCH relcur INTO v_child_event_id,v_rel_type_cd,v_rel_created_at;

		  -- exit IF THERE IS NO MORE CHILD FOUND FOR GIVEN EVENT_ID
     		exit when v_child_event_id is null;
     	
     		-- get the cancel amount 
        	IF v_rel_type_cd='AUTH_CANCEL'  THEN 
      	
		   		select coalesce(cancel.amount,0) INTO v_temp_txn_cancel_amt
		  		 from apx.cancel cancel
		   		where cancel.cancel_id = v_child_event_id 
		   		and cancel.created_at between v_rel_created_at and (current_date + interval '1 days' );
		    	v_total_txn_cancel_amt := coalesce(v_total_txn_cancel_amt,0) + coalesce(v_temp_txn_cancel_amt, 0);
		   
			END IF;
	
			-- query4: get the capture  amount 
			IF v_rel_type_cd='CAPTURE'  THEN 

				  select capture_id,coalesce(cap.amount,0), cap.created_at, cap.psp_txn_ref INTO v_capture_id,v_temp_txn_capture_amt, 
						cap_created_at, txnrec.capture_psp_ref
				  from apx.capture cap
				  where cap.capture_id = v_child_event_id
				  and cap.created_at = v_rel_created_at;
				  v_total_txn_capture_amt :=v_total_txn_capture_amt+v_temp_txn_capture_amt;
				  v_capture_count :=v_capture_count+1;
				    
				  txnrec.txn_capture_id := v_capture_id;
				  txnrec.capture_created_at := cap_created_at;
			
           end if;	
          
          ----  get the capture CANCEL  amount 
          IF v_rel_type_cd='CAPTURE_CANCEL' then
		          
		             select can.amount INTO v_temp_amt
		              from apx.cancel can
		              where can.cancel_id = v_child_event_id 
		              and can.created_at = v_rel_created_at;
		            v_txn_cap_cancel_amt :=v_txn_cap_cancel_amt+v_temp_amt;
		           
		   end if;
		  
		   ----  get the  REFUND  amount 
		  
		   if v_rel_type_cd='REFUND' then
		          
		             select rfnd.amount INTO v_temp_amt
		              from apx.refund rfnd
		              where rfnd.refund_id = v_child_event_id 
		              and rfnd.created_at = v_rel_created_at;
		             
		            v_txn_cap_refund_amt :=v_txn_cap_refund_amt+v_temp_amt;

			end if;
		
		 ----  get the  REFUND CANCEL  amount 
		   IF v_rel_type_cd='REFUND_CANCEL' THEN
					 
					  select can.amount INTO v_temp_amt
		              from apx.cancel can
		              where can.cancel_id = v_child_event_id 
		              and can.created_at = v_rel_created_at;
					  v_txn_cap_ref_cancel_amt :=v_txn_cap_ref_cancel_amt+ coalesce(v_temp_amt,0);
					 
		    END IF;

						      
		end loop;
		 
	CLOSE relcur;	


    txnrec.txn_cancel_amt :=v_total_txn_cancel_amt;	
    txnrec.txn_capture_amt :=v_total_txn_capture_amt;
    txnrec.txn_capture_count :=v_capture_count;
    txnrec.txn_cap_cancel_amt :=v_txn_cap_cancel_amt;
	txnrec.txn_cap_refund_amt :=v_txn_cap_refund_amt;
	txnrec.txn_cap_ref_cancel_amt :=v_txn_cap_ref_cancel_amt;


	RETURN txnrec;												   
END;
$function$
;
