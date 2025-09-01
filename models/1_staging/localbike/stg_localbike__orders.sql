SELECT
    order_id,
    customer_id,
    order_status, 
    CASE 
        WHEN order_status IN (1, 2, 3) THEN 'Not Delivered'
        WHEN order_status = 4 THEN 'Delivered'
        ELSE 'Unknown'
    END AS order_status_label,
    DATE(order_date) AS order_date,
    EXTRACT(YEAR FROM DATE(order_date)) AS order_year,
    DATE(required_date) AS required_date,  
    CASE 
        WHEN shipped_date IS NOT NULL AND shipped_date != '' AND LOWER(TRIM(shipped_date)) != 'null'
            THEN DATE(shipped_date)
        ELSE NULL
    END AS shipped_date,    
    store_id,
    staff_id
FROM
    {{ source('localbike', 'orders') }}
-- WHERE EXTRACT(YEAR FROM TIMESTAMP(order_date, 'Europe/Paris')) > 2015