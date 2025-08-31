select
    s.store_id,
    s.store_name,
    s.store_state,
    s.store_city,
    s.store_zip_code,
    o.order_date,
    ROUND(SUM(oi.net_amount_spent), 2) AS total_net_store_amount
from {{ ref('stg_localbike__stores') }} as s
inner join {{ ref('stg_localbike__orders') }} o ON s.store_id = o.store_id
inner join {{ ref('stg_localbike__order_items') }} oi ON o.order_id = oi.order_id
GROUP BY
    s.store_id,
    s.store_name,
    s.store_state,
    s.store_city,
    s.store_zip_code,
    o.order_date
