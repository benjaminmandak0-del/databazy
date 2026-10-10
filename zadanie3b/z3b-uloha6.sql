WITH RECURSIVE date_bounds AS (
    SELECT
        MIN(sale_date)::date AS start_date,
        MAX(sale_date)::date AS end_date
    FROM flourmills_sales
),
calendar AS (
    SELECT start_date AS sale_date
    FROM date_bounds

    UNION ALL

    SELECT (c.sale_date + INTERVAL '1 day')::date
    FROM calendar c
    CROSS JOIN date_bounds b
    WHERE c.sale_date < b.end_date
)
SELECT sale_date
FROM calendar
ORDER BY sale_date ASC;