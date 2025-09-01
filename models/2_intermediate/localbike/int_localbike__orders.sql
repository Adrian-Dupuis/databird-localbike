select 
    o.order_id, 
    o.order_status_label, 
    o.order_date, 
    o.shipped_date, 
    o.days_to_ship_order, 
    oi.product_id, 
    p.product_name, 
    p.brand_id, 
    b.brand_name,
    p.model_year, 
    c.category_name,
    cus.customer_first_name, 
    cus.customer_last_name, 
    cus.customer_email, 
    cus.customer_phone,
    cus.customer_city, 
    cus.customer_state, 
    cus.customer_zip_code,
    s.store_city, 
    s.store_state, 
    s.store_zip_code,
    oi.quantity, 
    oi.list_price, 
    oi.discount, 
    oi.net_price,
    oi.gross_sales_amount,
    oi.net_sales_amount, 
    oi.discount_amount
FROM {{ ref('stg_localbike__orders') }} as o
INNER JOIN {{ ref('stg_localbike__order_items') }} as oi on o.order_id = oi.order_id 
INNER JOIN {{ ref('stg_localbike__products') }} as p on oi.product_id = p.product_id
INNER JOIN {{ ref('stg_localbike__brands') }} as b on p.brand_id = b.brand_id
INNER JOIN {{ ref('stg_localbike__categories') }} as c on p.category_id = c.category_id
INNER JOIN {{ ref('stg_localbike__customers') }} as cus on o.customer_id = cus.customer_id 
INNER JOIN {{ ref('stg_localbike__stores') }} as s on o.store_id = s.store_id
