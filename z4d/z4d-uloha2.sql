WITH customer_profit AS (
    SELECT
        c.region,
        c.customer_name,
        SUM(o.profit) AS total_profit
    FROM customers c
    JOIN orders o
        ON c.customer_id = o.customer_id
    GROUP BY c.region, c.customer_name
),
ranked_profit AS (
    SELECT
        region,
        customer_name,
        total_profit,
        RANK() OVER (
            PARTITION BY region
            ORDER BY total_profit DESC
        ) AS rank_num,
        DENSE_RANK() OVER (
            PARTITION BY region
            ORDER BY total_profit DESC
        ) AS dense_rank_num
    FROM customer_profit
)
SELECT
    region,
    customer_name,
    total_profit,
    rank_num,
    dense_rank_num
FROM ranked_profit
ORDER BY region, rank_num, customer_name;
