with payments as (

    select * from {{ ref('stg_payments')}}

)

select 
    order_id,
    count(*) as num_fails
from payments 
where status = 'fail'
group by order_id 
having num_fails > 3 