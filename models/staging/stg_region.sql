
with region as (
    select 
       R_REGIONKEY      as region_id,
       R_NAME           as region_name

    from dbt.raw.region
)

select * from region