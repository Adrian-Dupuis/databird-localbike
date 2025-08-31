select
  p.product_id,
  p.product_name,
  b.brand_name,
  c.category_name,
  p.model_year,
  oi.quantity,
  oi.net_amount_spent,
  oi.discount,
  oi.order_id,
  s.stocks_quantity
from  {{ ref('stg_localbike__order_items') }} as oi
inner join {{ ref('stg_localbike__products') }} p ON oi.product_id = p.product_id
inner join {{ ref('stg_localbike__brands') }} b ON p.brand_id = b.brand_id
inner join {{ ref('stg_localbike__categories') }} c ON p.category_id = c.category_id
inner join {{ ref('stg_localbike__stocks') }} s ON oi.product_id = s.product_id
