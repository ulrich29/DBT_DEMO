{{ 
    config(schema='service')
}}

with region as (
    select * from {{ ref ('stg_region') }}
),

nation as (

    select * from {{ ref ('stg_nation') }}
)

select 
    nation.nation_id,
    nation.nation_name,
    region.region_name

from nation 
left join region using(region_id)