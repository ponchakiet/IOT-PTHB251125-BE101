CREATE VIEW v_order_summary AS
SELECT
    c.full_name,
    o.total_amount,
    o.order_date
FROM customer c
         JOIN orders o ON c.customer_id = o.customer_id
with check option;

SELECT * FROM v_order_summary;

UPDATE v_order_summary
SET total_amount = total_amount * 1.05
WHERE order_id = 1;

SELECT * FROM v_order_summary WHERE order_id = 1;

CREATE VIEW v_monthly_sales AS
SELECT
    EXTRACT(YEAR FROM order_date) AS sales_year,
    EXTRACT(MONTH FROM order_date) AS sales_month,
    SUM(total_amount) AS monthly_revenue
FROM orders
GROUP BY sales_year, sales_month
ORDER BY sales_year, sales_month;

SELECT * FROM v_monthly_sales;

DROP VIEW v_order_summary;
DROP VIEW v_monthly_sales;