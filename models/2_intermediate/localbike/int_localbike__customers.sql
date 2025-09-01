

  SELECT
    o.customer_id,
    o.order_id,
    o.order_date,
    ROUND(SUM(net_sales_amount),2) as total_net_sales_amount
  FROM {{ ref('stg_localbike__orders') }} o
  JOIN {{ ref('stg_localbike__order_items') }} oi ON o.order_id = oi.order_id
  GROUP BY 
    o.customer_id, 
    o.order_id, 
    o.order_date


 




