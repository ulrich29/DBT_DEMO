
{{ 
    config(schema='staging')
}}


with orders_source as (

    select * from {{ source ('mon_commerce','orders') }}
),

orders as (
    select 
    
       O_ORDERKEY       as order_id,
       O_CUSTKEY        as customer_id,
       O_TOTALPRICE     as order_amount,
       O_ORDERDATE      as order_date,
       O_ORDERPRIORITY  as order_priority

    from orders_source
)

select * from orders 