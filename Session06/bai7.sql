INSERT INTO Department (name) VALUES
('IT'),
('Sales'),
('Marketing'),
('HR');

INSERT INTO Employee (full_name, department_id, salary) VALUES
('Nguyễn Văn An', 1, 15000000.00),
('Trần Thị Bình', 2, 8000000.00),
('Lê Hoàng Nam', 1, 12000000.00),
('Phạm Quang Minh', 3, 25000000.00),
('Võ Thanh Anh', 2, 11000000.00),
('Đỗ Thúy Hà', 4, 7500000.00),
('Phan Mai Linh', 1, 18000000.00),
('Phạm Nguyễn Ngọc Mai', NULL, 9000000.00);

SELECT
    e.full_name,
    d.name AS department_name
FROM Employee e
INNER JOIN Department d ON e.department_id = d.id;

SELECT
    d.name AS department_name,
    AVG(e.salary) AS avg_salary
FROM Department d
INNER JOIN Employee e ON d.id = e.department_id
GROUP BY d.name
HAVING AVG(e.salary) > 10000000.00;

INSERT INTO Department (name) VALUES ('R&D');

SELECT
    d.name AS department_name
FROM Department d
LEFT JOIN Employee e ON d.id = e.department_id
WHERE e.id IS NULL;