

SELECT order_id
FROM {{ ref('stg_localbike__order_items') }}
WHERE order_id NOT IN (
  SELECT order_id FROM {{ ref('stg_localbike__orders') }}
)



