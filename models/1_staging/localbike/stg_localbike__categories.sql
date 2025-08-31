SELECT
    category_id,
    category_name, 
    CASE
        WHEN LOWER(category_name) LIKE '%bicycles%' THEN 'Bicycles'
        WHEN LOWER(category_name) LIKE '%bikes%' THEN 'Bikes'
        ELSE 'Other'
    END AS category_type

FROM
    {{ source('localbike', 'categories') }}