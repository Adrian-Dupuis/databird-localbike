SELECT *
FROM {{ ref('mrt_localbike__orders') }}
WHERE shipping_delay IS NOT NULL AND shipping_delay < 1
