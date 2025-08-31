select
    s.staff_id,
    s.manager_id,
    s.manager_first_name,
    s.manager_last_name,
    ROUND(SUM(oi.net_amount_spent), 2) AS total_net_store_amount
from {{ ref('stg_localbike__staffs') }} as s
inner join {{ ref('stg_localbike__orders') }} o ON s.staff_id = o.staff_id
inner join {{ ref('stg_localbike__order_items') }} oi ON o.order_id = oi.order_id

GROUP BY
    s.staff_id,
    s.manager_id,
    s.manager_first_name,
    s.manager_last_name