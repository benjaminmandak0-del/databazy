SELECT
    f.product_name,
    f.product_category,
    f.total_amount
FROM flourmills_sales f
WHERE f.total_amount > (
    SELECT AVG(f2.total_amount)
    FROM flourmills_sales f2
    WHERE f2.product_category = f.product_category
)
ORDER BY f.sales_id;
