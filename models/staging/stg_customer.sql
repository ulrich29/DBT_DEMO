
{{ 
    config(schema='staging')
}}

with customer as (
    select 
       C_CUSTKEY     as customer_id,
       C_NAME        as customer_name,
       C_ADDRESS     as customer_adresse,
       C_NATIONKEY   as customer_pays,
       C_PHONE       as customer_phone
    
    from dbt.raw.customer
)

select * from customer