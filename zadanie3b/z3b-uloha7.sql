WITH RECURSIVE monthly_revenue AS (
    SELECT
        DATE_TRUNC('month', sale_date) AS month,
        SUM(total_amount) AS revenue
    FROM flourmills_sales
    GROUP BY DATE_TRUNC('month', sale_date)
),
ordered_months AS (
    SELECT
        ROW_NUMBER() OVER (ORDER BY month) AS rn,
        month,
        revenue
    FROM monthly_revenue
),
cumulative_target AS (
    SELECT
        rn,
        month,
        revenue,
        revenue AS cumulative_revenue
    FROM ordered_months
    WHERE rn = 1

    UNION ALL

    SELECT
        next.rn,
        next.month,
        next.revenue,
        current.cumulative_revenue + next.revenue AS cumulative_revenue
    FROM cumulative_target current
    JOIN ordered_months next
        ON next.rn = current.rn + 1
    WHERE current.cumulative_revenue < 500000000
)
SELECT
    month,
    cumulative_revenue
FROM cumulative_target
WHERE cumulative_revenue >= 500000000
ORDER BY rn
LIMIT 1;
	