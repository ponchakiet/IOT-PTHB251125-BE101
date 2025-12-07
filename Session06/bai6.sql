INSERT INTO OrderInfo (customer_id, order_date, total, status) VALUES
(101, '2023-10-15', 35000000.00, 'Completed'),
(102, '2023-09-28', 12000000.00, 'Completed'),
(103, '2024-01-05', 48000000.00, 'Completed'),
(101, '2024-02-20', 2500000.00, 'Pending'),
(104, '2024-03-25', 9800000.00, 'Shipped'),
(105, '2023-11-10', 10000000.00, 'Completed'),
(106, '2024-04-01', 50000000.00, 'Completed');

SELECT
    SUM(total) AS total_revenue,
    COUNT(id) AS total_orders,
    AVG(total) AS average_order_value
FROM OrderInfo;

SELECT
    EXTRACT(YEAR FROM order_date) AS order_year,
    SUM(total) AS total_revenue
FROM OrderInfo
GROUP BY order_year;

SELECT
    EXTRACT(YEAR FROM order_date) AS order_year,
    SUM(total) AS total_revenue
FROM OrderInfo
GROUP BY order_year
HAVING SUM(total) > 50000000.00;

SELECT *
FROM OrderInfo
ORDER BY total DESC
LIMIT 5;