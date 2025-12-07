INSERT INTO Customer (name, email, phone, points) VALUES
('Nguyễn Văn Khang', 'khang.nv@example.com', '0901112222', 1500),
('Trần Thị Hà', 'ha.tt@example.com', '0903334444', 3200),
('Lê Hoàng Long', 'long.lh@example.com', '0905556666', 800),
('Phạm Đình Huy', 'huy.pd@example.com', '0907778888', 2100),
('Võ Thanh An', 'an.vt@example.com', '0909990000', 4500);

INSERT INTO OrderInfo (customer_id, order_date, total, status) VALUES
(1, '2024-10-15', 750000.00, 'Completed'),
(2, '2024-09-28', 490000.00, 'Completed'),
(4, '2024-10-05', 1200000.00, 'Completed'),
(1, '2024-11-20', 3500000.00, 'Pending'),
(5, '2024-10-25', 980000.00, 'Completed'),
(2, '2024-12-01', 600000.00, 'Shipped');

SELECT
    c.name AS customer_name,
    SUM(o.total) AS total_spent
FROM Customer c
JOIN OrderInfo o ON c.id = o.customer_id
GROUP BY c.name
ORDER BY total_spent DESC;

SELECT
    c.name AS customer_name,
    SUM(o.total) AS total_spent
FROM Customer c
JOIN OrderInfo o ON c.id = o.customer_id
GROUP BY c.name
HAVING SUM(o.total) = (
    SELECT MAX(total_spent)
    FROM (
        SELECT SUM(total) AS total_spent
        FROM OrderInfo
        GROUP BY customer_id
    ) AS SubqueryMax
);

SELECT
    c.name
FROM Customer c
LEFT JOIN OrderInfo o ON c.id = o.customer_id
WHERE o.id IS NULL;

SELECT
    c.name AS customer_name,
    SUM(o.total) AS total_spent
FROM Customer c
JOIN OrderInfo o ON c.id = o.customer_id
GROUP BY c.name
HAVING SUM(o.total) > (
    SELECT AVG(total_spent_by_customer)
    FROM (
        SELECT SUM(total) AS total_spent_by_customer
        FROM OrderInfo
        GROUP BY customer_id
    ) AS AverageSpent
);