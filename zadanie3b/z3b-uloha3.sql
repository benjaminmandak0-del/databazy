
WITH product_totals AS (
    SELECT
        product_category,
        product_name,
        SUM(quantity_sold * unit_price) AS total_product_sales
    FROM flourmills_sales
    GROUP BY product_category, product_name
),
ranked_products AS (
    SELECT
        product_category,
        product_name,
        total_product_sales,
        RANK() OVER (
            PARTITION BY product_category
            ORDER BY total_product_sales DESC
        ) AS category_rank
    FROM product_totals
)
SELECT
    product_category,
    product_name,
    total_product_sales,
    category_rank
FROM ranked_products
WHERE category_rank BETWEEN 1 AND 3
ORDER BY product_category, category_rank;

