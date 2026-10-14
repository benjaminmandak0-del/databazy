WITH customer_activity AS (
    SELECT
        c.customer_id,
        c.customer_name,
        o.order_date,
        MAX(o.order_date) OVER (PARTITION BY c.customer_id) AS last_order_date,
        MAX(o.order_date) OVER () AS latest_order_date
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
)
SELECT
    customer_id,
    customer_name,
    last_order_date
FROM customer_activity
GROUP BY
    customer_id,
    customer_name,
    last_order_date,
    latest_order_date
HAVING last_order_date < latest_order_date - INTERVAL '90 days'
ORDER BY last_order_date;
