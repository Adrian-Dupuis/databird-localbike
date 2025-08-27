SELECT
    order_id,
    item_id,
    product_id,
    quantity,
    list_price,
    discount
FROM
    {{ source('localbike', 'order_item') }}