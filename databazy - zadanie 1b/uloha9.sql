SELECT
    f.product_name,
    f.region,
    f.total_amount,
    (
        SELECT MIN(f2.total_amount)
        FROM flourmills_sales f2
        WHERE f2.region = f.region
    ) AS region_min_amount
FROM flourmills_sales f
ORDER BY f.sales_id;
