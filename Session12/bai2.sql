DROP TABLE IF EXISTS sales;
DROP TABLE IF EXISTS products;

CREATE TABLE products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100),
    stock INT NOT NULL
);

CREATE TABLE sales (
    sale_id INT PRIMARY KEY AUTO_INCREMENT,
    product_id INT,
    quantity INT NOT NULL,
    sale_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);

INSERT INTO products (product_name, stock)
VALUES 
('Laptop', 10),
('Chuột', 50);

DELIMITER $$

CREATE TRIGGER before_insert_sales
BEFORE INSERT ON sales
FOR EACH ROW
BEGIN
    DECLARE current_stock INT;
    SELECT stock INTO current_stock
    FROM products
    WHERE product_id = NEW.product_id;
    IF NEW.quantity > current_stock THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'So luong san pham khong du trong kho';
    END IF;
END$$

DELIMITER ;

INSERT INTO sales (product_id, quantity) VALUES (1, 5);
INSERT INTO sales (product_id, quantity) VALUES (1, 20);
