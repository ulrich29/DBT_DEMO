
{{ 
    config(schema='staging')
}}

with nation as (
    select 
       N_NATIONKEY      as nation_id,
       N_NAME           as nation_name,
       N_REGIONKEY      as region_id

    from dbt.raw.nation
)

select * from nation