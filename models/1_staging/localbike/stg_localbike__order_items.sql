SELECT
    CONCAT(order_id, '_', product_id) AS order_item_id,
    order_id,
    -- item_id, remove because not used in other tables no clear use
    product_id,
    quantity,
    -- Cast list_price en float avec 2 décimales
    ROUND(CAST(list_price AS FLOAT64), 2) AS list_price,
    -- Afficher discount en pourcentage sans décimale
    discount, 
    ROUND(CAST(list_price * (1 - discount) AS FLOAT64),2) AS net_price, 
    ROUND(CAST(list_price * quantity AS FLOAT64),2) AS gross_sales_amount, 
    ROUND(CAST(list_price * (1 - discount) * quantity AS FLOAT64),2) AS net_sales_amount, 
    -- Montant de la remise
    ROUND(CAST(list_price * discount AS FLOAT64), 2) AS discount_amount


FROM
    {{ source('localbike', 'order_items') }}