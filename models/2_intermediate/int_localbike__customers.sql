
WITH sales_orders_per_customer AS (
  SELECT
    o.customer_id,
    o.order_id,
    o.order_date,
    ROUND(SUM(net_amount_spent),2) as total_net_amount_spent 
  FROM {{ ref('stg_localbike__orders') }} o
  JOIN {{ ref('stg_localbike__order_items') }} oi ON o.order_id = oi.order_id
  GROUP BY 
    o.customer_id, 
    o.order_id, 
    o.order_date
)


  SELECT
    customer_id,
    MIN(order_date) AS first_order_date,
    MAX(order_date) AS last_order_date,
    COUNT(order_id) AS number_of_orders,
    ROUND(SUM(total_net_amount_spent),2) AS total_sales_amount,
    ROUND(SUM(total_net_amount_spent) / COUNT(order_id), 2) AS average_order_value
  FROM sales_orders_per_customer
  GROUP BY customer_id




