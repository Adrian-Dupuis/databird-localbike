SELECT
    s.staff_id,
    s.first_name AS staff_first_name,
    s.last_name AS staff_last_name,
    s.email AS staff_email,
    s.phone AS staff_phone,
    s.active AS staff_active,
    s.store_id,
    s.manager_id,
    m.first_name AS manager_first_name,
    m.last_name AS manager_last_name
FROM {{ source('localbike', 'staffs') }} s
LEFT JOIN {{ source('localbike', 'staffs') }} m
  ON SAFE_CAST(s.manager_id AS INT64) = m.staff_id
