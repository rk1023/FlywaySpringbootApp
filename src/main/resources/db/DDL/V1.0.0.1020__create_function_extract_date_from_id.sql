CREATE OR REPLACE FUNCTION apx.extract_date_from_id(p_event_id VARCHAR)
 RETURNS TIMESTAMPTZ(3)
 LANGUAGE plpgsql
AS $function$
declare


v_event_created_at TIMESTAMPTZ(3) :=null;
v_last_eight_char VARCHAR(8);
v_id_length numeric :=0;
v_extracted_date date;

														 
begin
	
	-- if input id is null return null
	  if p_event_id is null then 
        return v_event_created_at;
      end if;
	
	
	 v_id_length :=LENGTH(p_event_id);

	-- if input id  length is <= 32 , it means that it is an old id generted by apexx , so can't extract date
      if v_id_length<=32 then 
         return v_event_created_at;
      end if;
	
      v_last_eight_char :=RIGHT(p_event_id, 8);
    
      v_extracted_date := TO_DATE(v_last_eight_char, 'YYYYMMDD');
      v_event_created_at :=v_extracted_date::TIMESTAMPTZ;

    RETURN v_event_created_at;	

-- if any exception occurs return null
   EXCEPTION WHEN others THEN
      RETURN v_event_created_at;

END;
$function$
;
