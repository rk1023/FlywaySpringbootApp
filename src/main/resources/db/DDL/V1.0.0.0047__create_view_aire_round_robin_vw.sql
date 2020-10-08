CREATE OR REPLACE VIEW mdm.aire_round_robin_vw
AS SELECT aire_round_robin.rrbn_id,
    aire_round_robin.party_id,
    aire_round_robin.method_cd,
    aire_round_robin.counter_type_cd,
    aire_round_robin.counter_val,
    aire_round_robin.psp,
    aire_round_robin.rrbn_val,
    aire_round_robin.cascade_psp_01,
    aire_round_robin.cascade_psp_02,
    aire_round_robin.cascade_psp_03,
    aire_round_robin.cascade_psp_04,
    aire_round_robin.start_dt,
    aire_round_robin.end_dt,
    aire_round_robin.created_by,
    aire_round_robin.created_at,
    aire_round_robin.updated_by,
    aire_round_robin.updated_at,
        CASE
            WHEN aire_round_robin.method_cd::text = 'VOLUME_BASED'::text AND aire_round_robin.counter_type_cd::text = 'ABSOLUTE'::text THEN (aire_round_robin.rrbn_val::text || ' of '::text) || aire_round_robin.counter_val::text
            WHEN aire_round_robin.method_cd::text = 'VOLUME_BASED'::text AND aire_round_robin.counter_type_cd::text = 'PERCENTAGE'::text THEN (aire_round_robin.rrbn_val::text || '% of '::text) || aire_round_robin.counter_val::text
            WHEN aire_round_robin.method_cd::text = 'DAY_BASED'::text THEN ('IN DAYS ('::text || aire_round_robin.rrbn_val::text) || ')'::text
            WHEN aire_round_robin.method_cd::text = 'TIME_RANGE_BASED'::text THEN 'BETWEEN '::text || replace(aire_round_robin.rrbn_val::text, ','::text, ' - '::text)
            ELSE NULL::text
        END AS rrbn_calc_val,
        CASE
            WHEN aire_round_robin.method_cd::text = 'VOLUME_BASED'::text AND aire_round_robin.counter_type_cd::text = 'ABSOLUTE'::text THEN 'COUNTER <= '::text || aire_round_robin.rrbn_val::text
            WHEN aire_round_robin.method_cd::text = 'VOLUME_BASED'::text AND aire_round_robin.counter_type_cd::text = 'PERCENTAGE'::text THEN 'COUNTER  <= '::text || (aire_round_robin.rrbn_val::integer * aire_round_robin.counter_val / 100)
            WHEN aire_round_robin.method_cd::text = 'DAY_BASED'::text THEN ( SELECT (' DAY IN ( '::text || string_agg(y.display_name::text, ','::text)) || ' ) '::text
               FROM ( SELECT unnest(string_to_array(aire_round_robin.rrbn_val::text, ','::text)) AS days) x,
                mdm.lookup_val y
              WHERE y.lookup::text = 'WEEK_DAYS'::text AND y.lookup_val::text = x.days)
            WHEN aire_round_robin.method_cd::text = 'TIME_RANGE_BASED'::text THEN ( SELECT (' TIME BETWEEN ( '::text || string_agg(y.display_name::text, ' AND '::text)) || ' ) '::text
               FROM ( SELECT unnest(string_to_array(aire_round_robin.rrbn_val::text, ','::text)) AS times) x,
                mdm.lookup_val y
              WHERE y.lookup::text = 'TIME'::text AND y.lookup_val::text = x.times)
            ELSE NULL::text
        END AS rrbn_rule_expr
   FROM mdm.aire_round_robin;