{%- set commande_priorites = ['bank_1','Bank_2','bank_3','bank_6'] -%}


with orders  as (
    select * from {{ ref ('stg_orders')}}
),
customers as (
    select * from {{ ref ('dim_customers')}}
),


pivoted as (
   select 

    orders.order_id,
    orders.customer_id,
    customers.nation_id,



    {% for priorite in commande_priorites -%}

    sum(case when order_priority='{{ priorite }}' then order_amount else 0 end) as {{ priorite }}_amount

    {%- if not loop.last -%}
        ,
    {%- endif -%}


    {%- endfor -%}

   from orders
        left join customers using (customer_id) 
)

select * from pivoted