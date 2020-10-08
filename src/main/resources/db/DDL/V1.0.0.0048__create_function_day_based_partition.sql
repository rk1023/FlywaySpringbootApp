CREATE OR REPLACE PROCEDURE mdm.create_day_based_partition(p_year INT,p_schema_name VARCHAR,
p_table_name VARCHAR,p_day INT ,p_disable_autovacuum boolean)
LANGUAGE plpgsql    
AS $$
DECLARE

v_partition_start_dt timestamp(3);
v_partition_end_dt timestamp(3);
v_max_end_dt timestamp(3);

i INT;

create_partition_query VARCHAR;

v_open_bracket VARCHAR :='(';
v_closed_bracket VARCHAR :=')';

v_partition_name VARCHAR;
v_open_bracket_2 VARCHAR :='(';
v_closed_bracket_2 VARCHAR :=')';
v_disable_autovaccum_query VARCHAR; 


BEGIN
v_open_bracket :=v_open_bracket||substring('Blog''s' from 5 for 1); --to concat ' substring is used 
v_closed_bracket :=substring('Blog''s' from 5 for 1)||v_closed_bracket;

v_partition_start_dt := TO_TIMESTAMP(p_year||'-01-01 00:00:00','YYYY-MM-DD HH24:MI:SS');

v_max_end_dt :=TO_TIMESTAMP((p_year+1)||'-01-01 00:00:00','YYYY-MM-DD HH24:MI:SS');



i :=1;

loop
v_partition_name :=p_schema_name||'.'||p_table_name||'_'||p_year||'_P';


v_partition_end_dt :=v_partition_start_dt + interval '1 Day' * (p_day);


exit when v_partition_start_dt>=v_max_end_dt;

IF v_partition_end_dt>v_max_end_dt  THEN
v_partition_end_dt :=v_max_end_dt;
END IF;


if i<10 then 
v_partition_name :=v_partition_name||'00'||i;
elseif i<100 then 
v_partition_name :=v_partition_name||'0'||i;
else
v_partition_name :=v_partition_name||i;
end if;

create_partition_query :='CREATE TABLE '||v_partition_name;

create_partition_query :=create_partition_query||' PARTITION OF ';
create_partition_query :=create_partition_query||p_schema_name||'.'|| p_table_name ;

create_partition_query :=create_partition_query||' FOR VALUES FROM ' ||v_open_bracket ;
create_partition_query :=create_partition_query||v_partition_start_dt||v_closed_bracket;
create_partition_query :=create_partition_query || ' TO '||v_open_bracket ||v_partition_end_dt||v_closed_bracket;

v_disable_autovaccum_query :='ALTER TABLE '||v_partition_name||' SET ';
v_disable_autovaccum_query :=v_disable_autovaccum_query||'( autovacuum_enabled = false )';

--raise notice  ' % ', create_partition_query;
--raise notice  ' % ', v_disable_autovaccum_query;

 
execute create_partition_query;

IF p_disable_autovacuum=TRUE THEN
execute v_disable_autovaccum_query;
END IF;

v_partition_start_dt :=v_partition_end_dt;

i :=i+1;

exit when i>500; -- just to make sure loop doesn't go to infinite loop due any any condition failure

end loop;

raise notice  ' % partitions created! ', i-1;

END;
$$;


