INSERT INTO OldCustomers (name, city) VALUES
('Nguyễn Văn A', 'Hà Nội'),
('Trần Thị B', 'TP.HCM'),
('Lê Hoàng C', 'Hà Nội'),
('Phạm Đình D', 'Đà Nẵng');

INSERT INTO NewCustomers (name, city) VALUES
('Nguyễn Văn A', 'Hà Nội'),
('Võ Thanh E', 'TP.HCM'),
('Đỗ Thúy F', 'Hà Nội'),
('Trần Thị B', 'TP.HCM'),
('Lý Văn G', 'Cần Thơ');

SELECT name, city FROM OldCustomers
UNION
SELECT name, city FROM NewCustomers
ORDER BY name;

SELECT name, city FROM OldCustomers
INTERSECT
SELECT name, city FROM NewCustomers
ORDER BY name;

WITH AllCustomers AS (
    SELECT city FROM OldCustomers
    UNION ALL
    SELECT city FROM NewCustomers
)
SELECT
    city,
    COUNT(id) AS customer_count
FROM AllCustomers
GROUP BY city
ORDER BY customer_count DESC;

WITH CityCounts AS (
    SELECT
        city,
        COUNT(id) AS customer_count
    FROM (
        SELECT city FROM OldCustomers
        UNION ALL
        SELECT city FROM NewCustomers
    ) AS AllCustomers
    GROUP BY city
)
SELECT city
FROM CityCounts
WHERE customer_count = (
    SELECT MAX(customer_count)
    FROM CityCounts
);