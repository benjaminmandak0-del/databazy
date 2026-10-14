WITH first_purchase AS (
    SELECT
        c.customer_id,
        DATE_TRUNC('month', MIN(o.order_date)) AS first_month
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    GROUP BY c.customer_id
),
returned_customers AS (
    SELECT
        fp.customer_id
    FROM first_purchase fp
    WHERE fp.first_month = DATE '2024-06-01'
      AND EXISTS (
            SELECT 1
            FROM orders o2
            WHERE o2.customer_id = fp.customer_id
              AND DATE_TRUNC('month', o2.order_date) > fp.first_month
      )
)
SELECT COUNT(*) AS returned_count
FROM returned_customers;
