select
  product_id,
  product_name,
  brand_name,
  category_name,
  model_year,
  SUM(quantity) as total_quantity_sold,
  ROUND(SUM(net_amount_spent),2) AS total_sales_amount,
  ROUND(AVG(discount),2) AS average_discount,
  COUNT(DISTINCT order_id) as number_of_orders,
  SUM(stocks_quantity) as total_stocks_quantity
from  {{ ref('int_localbike__products_performance') }}
group by
  product_id,
  product_name,
  brand_name,
  category_name,
  model_year