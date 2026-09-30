SELECT
    f.product_name,
    f.region,
    f.sale_date,
    f.total_amount
FROM flourmills_sales f
WHERE EXISTS (
    SELECT 1
    FROM flourmills_sales f2
    WHERE f2.region = f.region
      AND EXTRACT(YEAR FROM f2.sale_date) = 2024
)
ORDER BY f.sales_id;
