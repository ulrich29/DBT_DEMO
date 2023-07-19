
with orders as (
    select 
    
       O_ORDERKEY       as order_id,
       O_CUSTKEY        as customer_id,
       O_TOTALPRICE     as order_amount,
       O_ORDERDATE      as order_date,
       O_ORDERPRIORITY  as order_priority

    
    from dbt.raw.orders
)

select * from orders