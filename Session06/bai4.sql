INSERT INTO OrderInfo (customer_id, order_date, total, status) VALUES
(101, '2024-10-15', 750000.00, 'Pending'),
(102, '2024-09-28', 490000.00, 'Shipped'),
(103, '2024-10-05', 1200000.00, 'Completed'),
(101, '2024-11-20', 3500000.00, 'Pending'),
(104, '2024-10-25', 980000.00, 'Completed');

SELECT id, order_date, total
FROM OrderInfo
WHERE total > 500000.00;

SELECT id, order_date, total
FROM OrderInfo
WHERE order_date BETWEEN '2024-10-01' AND '2024-10-31';

SELECT id, order_date, status
FROM OrderInfo
WHERE status <> 'Completed';

SELECT id, order_date, total
FROM OrderInfo
ORDER BY order_date DESC
LIMIT 2;