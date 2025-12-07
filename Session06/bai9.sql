INSERT INTO Product (name, category, price) VALUES
('Laptop Gaming X', 'Điện tử', 30000000.00),
('Áo Thun Nam', 'Thời trang', 350000.00),
('Điện Thoại Z', 'Điện tử', 15000000.00),
('Ghế Massage', 'Nội thất', 22000000.00),
('Bút Bi Cao Cấp', 'Văn phòng', 50000.00),
('Balo Du Lịch', 'Thời trang', 700000.00),
('Sách Lập Trình', 'Sách', 200000.00);

INSERT INTO Orders (customer_id, order_date, total_amount) VALUES
(101, '2024-10-01', 50000000.00),
(102, '2024-10-05', 10000000.00),
(103, '2024-10-10', 500000.00);

INSERT INTO OrderDetail (order_id, product_id, quantity) VALUES
(1, 1, 1),
(1, 3, 1),
(2, 4, 2),
(2, 2, 5),
(3, 5, 10);

SELECT
    p.name AS product_name,
    SUM(p.price * od.quantity) AS total_sales
FROM Product p
JOIN OrderDetail od ON p.id = od.product_id
GROUP BY p.name;

SELECT
    p.category,
    AVG(p.price * od.quantity) AS average_category_sales
FROM Product p
JOIN OrderDetail od ON p.id = od.product_id
GROUP BY p.category
HAVING AVG(p.price * od.quantity) > 20000000.00;

SELECT
    p.name AS product_name
FROM Product p
JOIN OrderDetail od ON p.id = od.product_id
GROUP BY p.name
HAVING SUM(p.price * od.quantity) > (
    SELECT AVG(total_product_sales)
    FROM (
        SELECT SUM(p.price * od.quantity) AS total_product_sales
        FROM Product p
        JOIN OrderDetail od ON p.id = od.product_id
        GROUP BY p.id
    ) AS AvgSales
);

SELECT
    p.name AS product_name,
    COALESCE(SUM(od.quantity), 0) AS total_quantity_sold
FROM Product p
LEFT JOIN OrderDetail od ON p.id = od.product_id
GROUP BY p.name
ORDER BY total_quantity_sold DESC;