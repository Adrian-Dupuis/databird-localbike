select
    order_id,
    sum(quantity) as total_quantity
from {{ ref('stg_localbike__order_items') }}
group by order_id
having total_list_price < 0