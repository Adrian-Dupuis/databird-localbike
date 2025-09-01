SELECT
    category_id,
    category_name, 
    CASE
        WHEN LOWER(category_name) LIKE '%electric%' THEN 'Electric'
        ELSE 'Non electric'
    END AS category_type

FROM
    {{ source('localbike', 'categories') }}