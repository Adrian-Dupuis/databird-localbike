select
  product_id,
  product_name,
  brand_name,
  category_name,
  model_year,
  SUM(quantity) as total_quantity_sold,
  ROUND(SUM(gross_sales_amount),2) AS total_gross_sales_amount,
  ROUND(SUM(net_sales_amount),2) AS total_net_sales_amount,
  ROUND(AVG(discount),2) AS average_discount,
  COUNT(DISTINCT order_id) as number_of_orders,
  ROUND(SUM(net_sales_amount) / COUNT(order_id), 2) AS net_sales_per_order
from  {{ ref('int_localbike__products_performance') }}
group by
  product_id,
  product_name,
  brand_name,
  category_name,
  model_year