SELECT COUNT(*)
FROM (
    SELECT DISTINCT f.product_category
    FROM flourmills_sales f
    WHERE NOT EXISTS (
        SELECT 1
        FROM flourmills_sales f2
        WHERE f2.product_category = f.product_category
          AND f2.total_amount > 500000
    )
) AS categories_without_big_sales;
