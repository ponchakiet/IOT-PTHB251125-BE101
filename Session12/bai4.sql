DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS products;

CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(100),
    price NUMERIC(10,2) NOT NULL
);

CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    product_id INT REFERENCES products(product_id),
    quantity INT NOT NULL,
    total_amount NUMERIC(10,2),
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO products (product_name, price)
VALUES
('Laptop', 1500.00),
('Chuot', 20.00);

CREATE OR REPLACE FUNCTION calc_total_amount()
RETURNS TRIGGER AS $$
BEGIN
    SELECT price * NEW.quantity
    INTO NEW.total_amount
    FROM products
    WHERE product_id = NEW.product_id;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER before_insert_orders
BEFORE INSERT ON orders
FOR EACH ROW
EXECUTE FUNCTION calc_total_amount();

INSERT INTO orders (product_id, quantity) VALUES (1, 2);
INSERT INTO orders (product_id, quantity) VALUES (2, 5);

SELECT * FROM orders;
