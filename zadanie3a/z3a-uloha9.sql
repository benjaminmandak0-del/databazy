CREATE OR REPLACE PROCEDURE get_customer_sales(p_customer_id VARCHAR)
LANGUAGE plpgsql
AS $$
DECLARE
    total_sales NUMERIC(10,2);
BEGIN
    SELECT SUM(sales)
    INTO total_sales
    FROM orders
    WHERE customer_id = p_customer_id;

    RAISE NOTICE 'Customer: %, Total Sales: %', p_customer_id, total_sales;
END;
$$;

CALL get_customer_sales('C001');

