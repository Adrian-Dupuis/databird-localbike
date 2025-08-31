SELECT
    CONCAT(store_id,'_', product_id) AS store_product_id,
    store_id, 
    product_id,
    quantity as stocks_quantity
FROM
    {{ source('localbike', 'stocks') }}