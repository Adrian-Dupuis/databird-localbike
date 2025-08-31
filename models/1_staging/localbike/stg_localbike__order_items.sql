SELECT
    CONCAT(order_id, '_', product_id) AS order_item_id,
    order_id,
    -- item_id, remove because not used in other tables no clear use
    product_id,
    quantity,
    list_price,
    discount
FROM
    {{ source('localbike', 'order_item') }}