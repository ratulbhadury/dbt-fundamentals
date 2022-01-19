with orders as (
    select * from {{ ref('stg_orders')}}
),
payments as (
    select * from {{ ref('stg_payments') }}
),
final as (
    select
        orders.customer_id,
        orders.order_id,
        amount
    from orders
        left join payments using (order_id)
)
select * from final