SELECT
    order_id,
    customer_id,
    order_status, 
    CASE 
        WHEN order_status IN (1, 2, 3) THEN 'Not Delivered'
        WHEN order_status = 4 THEN 'Delivered'
        ELSE 'Unknown'
    END AS order_status_label,
    TIMESTAMP(order_date, 'Europe/Paris') AS order_date,
    EXTRACT(YEAR FROM TIMESTAMP(order_date, 'Europe/Paris')) AS order_year,
    TIMESTAMP(required_date, 'Europe/Paris') AS required_date,  
    CASE 
        WHEN shipped_date IS NOT NULL AND shipped_date != '' AND LOWER(TRIM(shipped_date)) != 'null'
            THEN TIMESTAMP(shipped_date, 'Europe/Paris')
        ELSE NULL
    END AS shipped_date,    
    CASE 
        WHEN shipped_date IS NOT NULL AND shipped_date != '' AND LOWER(TRIM(shipped_date)) != 'null'
            THEN TIMESTAMP_DIFF(TIMESTAMP(shipped_date, 'Europe/Paris'), TIMESTAMP(order_date, 'Europe/Paris'), DAY)
        ELSE NULL
    END AS days_to_ship_order,
    store_id,
    staff_id
FROM
    {{ source('localbike', 'orders') }}
WHERE EXTRACT(YEAR FROM TIMESTAMP(order_date, 'Europe/Paris')) > 2015