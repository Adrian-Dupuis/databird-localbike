select
    order_id,
    sum(list_price) as total_list_price
from {{ ref('stg_localbike__order_items') }}
group by order_id
having total_list_price < 0