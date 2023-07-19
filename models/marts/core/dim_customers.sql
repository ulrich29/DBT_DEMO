{{ 
    config(schema='service')
}}


with customers as(

    select * from {{ ref ('stg_customer') }}
),

orders as (

     select * from {{ ref ('stg_orders') }}

),

customer_orders as (

    select 

      customer_id ,
      min(order_date) as first_order_date,
      max(order_date) as most_recent_order_date,
      count(order_id) as number_of_orders

    from orders

    group by 1

),
nation as (

    select * from {{ ref ('stg_nation') }}
),

final as (

    select 

       customers.customer_id,
       customers.nation_id,
       customers.customer_name,
       customers.customer_adresse,
       customers.customer_pays,
       customers.customer_phone,
       customer_orders.first_order_date,
       customer_orders.most_recent_order_date,
       nation.nation_name,
       coalesce(customer_orders.number_of_orders,0) as number_of_orders

    from customers
    
    left join customer_orders using (customer_id)
    left join nation using (nation_id)
    

)

select * from final