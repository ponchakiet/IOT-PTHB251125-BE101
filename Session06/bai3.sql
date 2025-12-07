INSERT INTO Customer (name, email, phone, points) VALUES
('Nguyễn Văn Khang', 'khang.nv@example.com', '0901112222', 1500),
('Trần Thị Hà', 'ha.tt@example.com', '0903334444', 3200),
('Lê Hoàng Long', 'long.lh@example.com', '0905556666', 800),
('Phạm Đình Huy', NULL, '0907778888', 2100),
('Võ Thanh An', 'an.vt@example.com', '0909990000', 4500),
('Đỗ Thúy Anh', 'anh.dt@example.com', '0912223333', 1500),
('Nguyễn Văn Khang', 'khang2.nv@example.com', '0914445555', 2800);

SELECT DISTINCT name
FROM Customer;

SELECT *
FROM Customer
WHERE email IS NULL;

SELECT name, points
FROM Customer
ORDER BY points DESC
LIMIT 3 OFFSET 1;

SELECT *
FROM Customer
ORDER BY name DESC;