DROP TRIGGER IF EXISTS after_insert_sales;

DELIMITER $$

CREATE TRIGGER after_insert_sales
AFTER INSERT ON sales
FOR EACH ROW
BEGIN
    UPDATE products
    SET stock = stock - NEW.quantity
    WHERE product_id = NEW.product_id;
END$$

DELIMITER ;

SELECT * FROM products;

INSERT INTO sales (product_id, quantity) VALUES (1, 3);

SELECT * FROM products;
