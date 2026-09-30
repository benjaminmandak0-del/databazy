SELECT DISTINCT
    f.region
FROM flourmills_sales f
WHERE NOT EXISTS (
    SELECT 1
    FROM flourmills_sales f2
    WHERE f2.region = f.region
      AND f2.product_category = 'Flour'
)
ORDER BY f.region;
