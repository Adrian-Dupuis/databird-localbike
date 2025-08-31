select
  p.product_id,
  p.product_name,
  b.brand_name,
  c.category_name,
  p.model_year,
  SUM(oi.quantity) as total_quantity_sold,
  ROUND(SUM( net_amount_spent),2) AS total_sales_amount,
  ROUND(AVG(oi.discount),2) AS average_discount,
  COUNT(DISTINCT oi.order_id) as number_of_orders,
  SUM(s.stocks_quantity) as total_stocks_quantity
from  {{ ref('stg_localbike__order_items') }} as oi
inner join {{ ref('stg_localbike__products') }} p ON oi.product_id = p.product_id
inner join {{ ref('stg_localbike__brands') }} b ON p.brand_id = b.brand_id
inner join {{ ref('stg_localbike__categories') }} c ON p.category_id = c.category_id
inner join {{ ref('stg_localbike__stocks') }} s ON oi.product_id = s.product_id
group by
  p.product_id,
  p.product_name,
  b.brand_name,
  c.category_name,
  p.model_year
