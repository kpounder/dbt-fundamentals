WITH fct_orders AS (
    SELECT 
        o.order_id,
        o.customer_id,
        o.order_date, 
        COALESCE(SUM(p.amount), 0) AS amount 
    FROM {{ ref('stg_orders') }} o LEFT JOIN {{ ref('stg_payments') }} p 
        ON o.order_id =  p.order_id AND p.status = 'success'
    GROUP BY o.order_id, o.customer_id, o.order_date
)

SELECT * FROM fct_orders 