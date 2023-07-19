with orders as (
    select * from {{ ref ('stg_orders') }}
)

select 
    order_id,
    sum(order_amount) as total_amount

from orders

group by 1
having total_amount < 0

