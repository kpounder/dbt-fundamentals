with payments as (
    select
        id as payment_id,
        orderid as order_id,
        paymentmethod as payment_method,
        status,
        amount / 100 as amount,
        created::DATE as created_at,
        _batched_at::TIMESTAMP
    from {{ source('stripe', 'payment')}}
)

select * from payments 