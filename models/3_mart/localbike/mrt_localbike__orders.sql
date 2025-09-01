select     
    order_id, 
    order_status,
    order_status_label, 
    order_date, 
    order_year,
    shipped_date, 
    days_to_ship_order, 
    product_id, 
    product_name, 
    brand_id, 
    brand_name,
    model_year, 
    category_name,
    customer_first_name, 
    customer_last_name, 
    customer_email, 
    customer_phone,
    customer_city, 
    customer_state, 
    customer_zip_code,
    store_city, 
    store_state, 
    store_zip_code,
    quantity, 
    list_price, 
    discount, 
    net_price,
    gross_sales_amount,
    net_sales_amount, 
    discount_amount,
    TIMESTAMP_DIFF(
        (SELECT MAX(order_date) FROM {{ ref('int_localbike__orders') }}),
        order_date,
        DAY
    ) AS days_from_latest_order, 
    CASE
        WHEN shipped_date IS NOT NULL 
        THEN DATE_DIFF(shipped_date, order_date, DAY)
    END AS shipping_delay, 
    (
        SELECT AVG(DATE_DIFF(shipped_date, order_date, DAY))
        FROM {{ ref('int_localbike__orders') }}
        WHERE shipped_date IS NOT NULL
          AND DATE_DIFF(shipped_date, order_date, DAY) > 0
    ) AS avg_shipping_delay

from  {{ ref('int_localbike__orders') }}