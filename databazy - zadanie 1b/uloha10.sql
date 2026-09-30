SELECT
    f.product_name,
    f.product_category,
    f.sale_date,
    f.total_amount
FROM flourmills_sales f
WHERE EXISTS (
    SELECT 1
    FROM flourmills_sales f2
    WHERE f2.product_name = f.product_name
      AND EXTRACT(MONTH FROM f2.sale_date) <> EXTRACT(MONTH FROM f.sale_date)
)
ORDER BY f.sales_id;
