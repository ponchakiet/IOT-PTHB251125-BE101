INSERT INTO Employee (full_name, department, salary, hire_date) VALUES
('Nguyễn Văn An', 'IT', 7500000.00, '2023-05-15'),
('Trần Thị Bình', 'HR', 5800000.00, '2024-01-20'),
('Lê Hoàng Nam', 'Sales', 12000000.00, '2023-11-01'),
('Phạm Quang Minh', 'IT', 9200000.00, '2022-08-10'),
('Võ Thanh An', 'Marketing', 6500000.00, '2023-03-25'),
('Đỗ Thúy Hà', 'HR', 4500000.00, '2024-05-01');

UPDATE Employee
SET salary = salary * 1.10
WHERE department = 'IT';

DELETE FROM Employee
WHERE salary < 6000000.00;

SELECT *
FROM Employee
WHERE full_name ILIKE '%An%';

SELECT *
FROM Employee
WHERE hire_date BETWEEN '2023-01-01' AND '2023-12-31';