select distinct list_price
from {{ ref('stg_localbike__products') }}
where list_price < 0