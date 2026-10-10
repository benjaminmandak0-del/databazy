WITH customer_revenue AS (
    SELECT
        customer_type,
        SUM(quantity_sold * unit_price) AS revenue
    FROM flourmills_sales
    GROUP BY customer_type
),
revenue_percentages AS (
    SELECT
        customer_type,
        revenue,
        SUM(revenue) OVER () AS total_revenue,
        ROUND(
            revenue * 100.0 / SUM(revenue) OVER (),
            2
        ) AS revenue_percentage
    FROM customer_revenue
)
SELECT
    customer_type,
    revenue,
    total_revenue,
    revenue_percentage
FROM revenue_percentages
ORDER BY revenue DESC;
