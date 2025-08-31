 SELECT
    customer_id,
    MIN(order_date) AS first_order_date,
    MAX(order_date) AS last_order_date,
    COUNT(order_id) AS number_of_orders,
    ROUND(SUM(total_net_amount_spent),2) AS total_sales_amount,
    ROUND(SUM(total_net_amount_spent) / COUNT(order_id), 2) AS average_order_value
  FROM {{ ref('int_localbike__customers') }}
  GROUP BY customer_id

