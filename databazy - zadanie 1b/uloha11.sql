SELECT
    f.product_name,
    f.product_category,
    f.total_amount
FROM flourmills_sales f
WHERE EXISTS (
    SELECT 1
    FROM flourmills_sales f2
    WHERE f2.product_category = f.product_category
      AND f2.total_amount > 200000
)
ORDER BY f.sales_id;
