CREATE VIEW v_revenue_by_region AS
SELECT
    c.region,
    SUM(o.total_amount) AS total_revenue
FROM customer c
JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.region;

SELECT
    region,
    total_revenue
FROM v_revenue_by_region
ORDER BY total_revenue DESC
LIMIT 3;

CREATE VIEW v_editable_pending_orders AS
SELECT
    o.order_id,
    c.full_name,
    o.status
FROM orders o
JOIN customer c ON o.customer_id = c.customer_id
WHERE o.status IN ('Processing', 'Pending', 'Shipped')
WITH CHECK OPTION;

UPDATE v_editable_pending_orders
SET status = 'Shipped'
WHERE order_id = 1;

CREATE VIEW v_avg_national_revenue AS
SELECT AVG(total_revenue) AS national_average
FROM v_revenue_by_region;

CREATE VIEW v_revenue_above_avg AS
SELECT
    r.region,
    r.total_revenue
FROM v_revenue_by_region r
JOIN v_avg_national_revenue a ON r.total_revenue > a.national_average;

SELECT * FROM v_revenue_above_avg;