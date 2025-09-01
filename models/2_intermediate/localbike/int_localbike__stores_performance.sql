select
    s.staff_id,
    s.staff_first_name,
    s.staff_last_name,
    s.staff_email,
    s.staff_phone,
    s.staff_active,
    s.manager_id,
    s.manager_first_name,
    s.manager_last_name,
    store.store_id, 
    store.store_name,
    store.store_state,
    store.store_city,
    store.store_zip_code,
    o.order_date,
    o.customer_id,
    c.customer_first_name, 
    c.customer_last_name, 
    c.customer_phone, 
    c.customer_email, 
    c.customer_city, 
    c.customer_state, 
    c.customer_zip_code,
    oi.net_sales_amount,
    oi.gross_sales_amount,
    oi.discount_amount
from {{ ref('stg_localbike__staffs') }} as s
inner join {{ ref('stg_localbike__orders') }} o ON s.staff_id = o.staff_id
inner join {{ ref('stg_localbike__order_items') }} oi ON o.order_id = oi.order_id
inner join {{ ref('stg_localbike__stores') }} store on s.store_id = store.store_id
inner join {{ ref('stg_localbike__customers') }} c on o.customer_id = c.customer_id
