set search_path to session04;

CREATE TABLE products
(
    id           SERIAL PRIMARY KEY,
    name         VARCHAR(150) NOT NULL,
    category     VARCHAR(50)  NOT NULL,
    price        BIGINT       NOT NULL,
    stock        INT,
    manufacturer VARCHAR(50)  NOT NULL
);

INSERT INTO products (id, name, category, price, stock, manufacturer)
VALUES (1, 'Laptop Dell XPS 13', 'Laptop', 25000000, 12, 'Dell'),
       (2, 'Chuột Logitech M90', 'Phụ kiện', 150000, 50, 'Logitech'),
       (3, 'Bàn phím cơ Razer', 'Phụ kiện', 2200000, 0, 'Razer'),
       (4, 'Macbook Air M2', 'Laptop', 32000000, 7, 'Apple'),
       (5, 'iPhone 14 Pro Max', 'Điện thoại', 35000000, 15, 'Apple'),
       (6, 'Laptop Dell XPS 13', 'Laptop', 25000000, 12, 'Dell'),
       (7, 'Tai nghe AirPods 3', 'Phụ kiện', 4500000, NULL, 'Apple');

INSERT INTO products (id, name, category, price, stock, manufacturer)
VALUES ('8', 'Chuột không dây Logitech M170', 'Phụ kiện', 300000, 20, 'Logitech');

UPDATE products
SET price = price * 1.10
WHERE manufacturer = 'Apple';

DELETE
FROM products
WHERE stock = 0;

SELECT id,
       name,
       price
FROM products
WHERE price BETWEEN 1000000 AND 30000000
ORDER BY price DESC;

SELECT id,
       name,
       stock
FROM products
WHERE stock IS NULL;

SELECT DISTINCT manufacturer
FROM products;

SELECT id,
       name,
       price,
       manufacturer
FROM products
ORDER BY price DESC,
         name ASC;

SELECT id,
       name
FROM products
WHERE name ILIKE '%laptop%';

SELECT id,
       name,
       price
FROM products
ORDER BY price DESC
LIMIT 2;