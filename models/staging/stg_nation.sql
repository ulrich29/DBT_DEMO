
{{ 
    config(schema='staging')
}}

with nation_source as (

    select * from {{ source ('mon_commerce','nation') }}
), 

nation as (

    select 
       N_NATIONKEY      as nation_id,
       N_NAME           as nation_name,
       N_REGIONKEY      as region_id

    from nation_source
)

select * from nation