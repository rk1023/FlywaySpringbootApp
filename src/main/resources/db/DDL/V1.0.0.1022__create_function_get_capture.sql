CREATE OR REPLACE FUNCTION apx.get_capture(p_event_id character varying)
RETURNS apx.capture_info
LANGUAGE plpgsql
AS $function$
declare

v_event_created_at 	TIMESTAMPTZ(3);
v_from_date_time 	TIMESTAMPTZ(3);
v_to_date_time 	TIMESTAMPTZ(3);
v_txn_id VARCHAR(50);
v_txn_created_at TIMESTAMPTZ(3);
v_capture_craeted_at  TIMESTAMPTZ(3);


v_temp_event_id VARCHAR(50); 
v_temp_rel_event_id VARCHAR(50);
v_temp_rel_type_cd VARCHAR(50); 
v_temp_event_created_at TIMESTAMPTZ(3);
v_temp_rel_event_ceated_at TIMESTAMPTZ(3);
v_temp_root_event_ceated_at TIMESTAMPTZ(3);
v_temp_cancel_amt DECIMAL = 0;
v_temp_txn_capture_amt DECIMAL := 0;
v_temp_refund_amt DECIMAL := 0;
v_temp_refund_id_arr VARCHAR(50) [];
v_refund_id_count  DECIMAL := 0;
v_temp_refund_cancel_amt DECIMAL := 0;

						
evtcur_join CURSOR(c_event_id VARCHAR(50)) FOR
SELECT e.event_id,
e.event_type,
e.status_cd,
e.processing_state,
e.created_at,
c.capture_id,	
c.amount 		 as capture_amt,															   
c.account_id, 
c.org_id,	
c.psp_id,	
c.routing_cd 	 as routing_cd,
c.routing_type_cd  as routing_type_cd,	
c.curcy_cd 	 as currency,
c.merchant_ref  as merchant_ref,
c.psp_txn_ref 	 as psp_ref
FROM apx.events e , apx.capture c
WHERE e.event_id = c_event_id
and c.capture_id=c_event_id
and c.created_at between v_from_date_time and v_to_date_time
and e.event_type='CAPTURE'
and e.created_at between v_from_date_time and v_to_date_time
and e.status_cd !='FAILED'
limit 1;

parent_info_cur CURSOR(c_event_id VARCHAR(50)) FOR
select rel.rel_event_id txn_id ,rel.created_at created_at,rel.root_event_ceated_at txn_created_at
from apx.event_rel rel 
where rel.event_id = c_event_id 
and rel.created_at between v_from_date_time and v_to_date_time
and rel.status_cd !='FAILED'
limit 1;

root_event_rel_cur CURSOR(c_txn_id VARCHAR(50), c_txn_created_at TIMESTAMPTZ(3)) for
select rel.event_id , rel.rel_event_id ,rel.rel_type_cd , 
rel.created_at event_created_at, rel.rel_event_ceated_at ,rel.root_event_ceated_at txn_created_at
from apx.event_rel rel 
where rel.root_event_id = c_txn_id 
and rel.created_at between c_txn_created_at and current_date+interval '1 days'
and rel.status_cd !='FAILED'
limit 100;

	

capture_info_rec apx.capture_info;	
begin
	

	 
	
    capture_info_rec.event_id :=p_event_id;
   
	   --query 1 : extract date from id 
		v_event_created_at :=apx.extract_date_from_id(p_event_id);
	
	


-- if could not extract date from given capture_id then , look for last 15 months data
   if(v_event_created_at is null) then
     v_from_date_time :=(current_date - interval '15 months' ) ;
     v_to_date_time :=(current_date + interval '1 days' ) ;
    else  
       v_from_date_time :=v_event_created_at ;
       v_to_date_time :=(v_event_created_at + interval '1 days' ) ;
   end if;
  
  --query 2 : parent_id , created_at and root_event_created_at detail from event_rel table 
  open parent_info_cur(p_event_id);
 
   fetch parent_info_cur into v_txn_id ,v_capture_craeted_at, v_txn_created_at  ;
        capture_info_rec.created_at :=v_capture_craeted_at;
        capture_info_rec.txn_id :=v_txn_id;
       capture_info_rec.txn_created_at :=v_txn_created_at;
      
  close parent_info_cur;


  
   --query 3 : fetch data from event and capture table for given capture id .
  open evtcur_join(p_event_id);

    fetch evtcur_join into capture_info_rec.event_id, capture_info_rec.event_type, capture_info_rec.status_cd,
      capture_info_rec.processing_state,capture_info_rec.created_at,capture_info_rec.event_id,capture_info_rec.capture_amt,
      capture_info_rec.account_id,capture_info_rec.org_id,capture_info_rec.psp_id,capture_info_rec.routing_cd,
      capture_info_rec.routing_type_cd,capture_info_rec.currency,capture_info_rec.merchant_ref,capture_info_rec.psp_ref;

  close evtcur_join;


     -- update txn_capture_amt , capture count for given capture Id
     capture_info_rec.txn_capture_amt := coalesce(capture_info_rec.txn_capture_amt,0)+capture_info_rec.capture_amt;
     capture_info_rec.txn_capture_count := coalesce(capture_info_rec.txn_capture_count,0)+1;

	

	
 --query 4 : query txn table to get txn amount
	select txn.amount, txn.created_at, txn.txn_id , ev.status_cd 
	INTO capture_info_rec.txn_amt, capture_info_rec.txn_created_at, capture_info_rec.txn_id, capture_info_rec.txn_status_cd
	from apx.txn txn , apx.events ev
	where txn.txn_id=v_txn_id
	and txn.created_at=v_txn_created_at
	and  ev.event_id = v_txn_id
	and  ev.event_type = 'ORIG_TXN' 
	and ev.created_at = v_txn_created_at
	limit 1;



-- query 5: Fetch all data from event_rel for the txn_id

    open root_event_rel_cur(v_txn_id,v_txn_created_at);
     loop
    fetch root_event_rel_cur into  v_temp_event_id ,v_temp_rel_event_id ,v_temp_rel_type_cd , v_temp_event_created_at ,
          v_temp_rel_event_ceated_at,v_temp_root_event_ceated_at ;
  
        EXIT WHEN NOT FOUND;
       

       --query 6: get sum of all Auth cancel or Capture cancel amount against txn
       if v_temp_rel_type_cd in ('CAPTURE_CANCEL', 'AUTH_CANCEL') THEN
				select sum(can.amount) INTO v_temp_cancel_amt
				from apx.cancel can 
				where can.cancel_id = v_temp_event_id 
			    and can.created_at=v_temp_event_created_at;
			  
				capture_info_rec.txn_cancel_amt =  coalesce(capture_info_rec.txn_cancel_amt,0) + v_temp_cancel_amt;
		end if;
	
	
	 --query 7:  get total capture count and total capture amount against it's txn
	-- for given capture_id  amount and count has added above
	
	    if v_temp_event_id!=p_event_id   and   v_temp_rel_type_cd='CAPTURE'  THEN 
			  select coalesce(cap.amount,0) INTO v_temp_txn_capture_amt
			  from apx.capture cap
			  where cap.capture_id = v_temp_event_id
			  and cap.created_at = v_temp_event_created_at;
			 
			 capture_info_rec.txn_capture_amt := coalesce(capture_info_rec.txn_capture_amt,0)+v_temp_txn_capture_amt;
		     capture_info_rec.txn_capture_count := coalesce(capture_info_rec.txn_capture_count,0)+1;
	
		end if;
	
	
	 --query 8:  get refund amount and count against given capture_id only
	
	   IF v_temp_rel_event_id=p_event_id  and  v_temp_rel_type_cd='REFUND' then
	
	        select refund.amount INTO  v_temp_refund_amt
			from apx.refund refund
			where refund.refund_id = v_temp_event_id 
			and refund.created_at = v_temp_event_created_at;
											   
			capture_info_rec.refund_amt = coalesce(capture_info_rec.refund_amt,0) +	v_temp_refund_amt;
			capture_info_rec.refund_cnt = coalesce(capture_info_rec.refund_cnt,0) + 1;
		
		    v_refund_id_count :=v_refund_id_count+1;
		    v_temp_refund_id_arr[v_refund_id_count] :=v_temp_event_id;
	
	   end if;
	 
     end loop;
    
    close root_event_rel_cur;
   
   
   
  -- open below cursor only when ther is refund_id present against given capture_id
   
   if v_refund_id_count =0 then 
     return capture_info_rec;
     end if;  -- END IF 
     
    --query 9 :  open root_event_rel_cur again to calculate total refund cancle amount under given capture id only
   -- all refund id against given captureId are stored in v_temp_refund_id_arr in the first iteration
 
   
   open root_event_rel_cur(v_txn_id,v_txn_created_at);
     loop
     
     fetch root_event_rel_cur into  v_temp_event_id ,v_temp_rel_event_id ,v_temp_rel_type_cd , v_temp_event_created_at ,
          v_temp_rel_event_ceated_at,v_temp_root_event_ceated_at ;
  
        EXIT WHEN NOT FOUND;
       
       -- when rel_type_cd='REFUND_CANCEL' then rel_vent_id will be refund_id
        IF v_temp_rel_event_id= ANY(v_temp_refund_id_arr)  and  v_temp_rel_type_cd='REFUND_CANCEL' then
	
	  	        --Query cancel table to get cancel amount
	  	        
				select cancel.amount INTO v_temp_refund_cancel_amt
				from apx.cancel cancel
				where cancel.cancel_id = v_temp_event_id 
			    and cancel.created_at = v_temp_event_created_at;
			   
			   capture_info_rec.refund_cancel_amt :=coalesce(capture_info_rec.refund_cancel_amt,0)+v_temp_refund_cancel_amt;
	  
	   end if;
   
      end loop; -- END LOOP
   
   close root_event_rel_cur;  -- CLOSE root_event_rel_cur
  
 
  return capture_info_rec;

									   
END;

$function$ ;