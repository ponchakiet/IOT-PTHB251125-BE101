INSERT INTO Course (title, instructor, price, duration) VALUES
('Khóa học SQL cơ bản', 'An Nguyen', 1200000.00, 25),
('Lập trình Python nâng cao', 'Binh Tran', 2500000.00, 40),
('Quản trị CSDL SQL Server', 'Dat Le', 1800000.00, 35),
('Marketing Digital Demo', 'Phuong Vo', 500000.00, 15),
('Phân tích Dữ liệu với SQL và Excel', 'An Nguyen', 950000.00, 30),
('Thiết kế Web cơ bản', 'Hung Pham', 800000.00, 20),
('Khóa học SQL Chuyên sâu', 'Binh Tran', 3200000.00, 45);

UPDATE Course
SET price = price * 1.15
WHERE duration > 30;

DELETE FROM Course
WHERE title ILIKE '%Demo%';

SELECT title, instructor
FROM Course
WHERE title ILIKE '%SQL%';

SELECT title, price
FROM Course
WHERE price BETWEEN 500000.00 AND 2000000.00
ORDER BY price DESC
LIMIT 3;