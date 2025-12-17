CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    stock INT NOT NULL CHECK (stock >= 0)
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    product_id INT NOT NULL REFERENCES products(id),
    quantity INT NOT NULL CHECK (quantity > 0)
);


CREATE OR REPLACE FUNCTION update_product_stock()
RETURNS TRIGGER AS $$
DECLARE
    diff INT;
BEGIN
    IF TG_OP = 'INSERT' THEN
        UPDATE products
        SET stock = stock - NEW.quantity
        WHERE id = NEW.product_id;
        RETURN NEW;
    ELSIF TG_OP = 'UPDATE' THEN
        diff := NEW.quantity - OLD.quantity;
        IF diff > 0 THEN
            UPDATE products
            SET stock = stock - diff
            WHERE id = NEW.product_id;

        ELSIF diff < 0 THEN
            UPDATE products
            SET stock = stock + diff
            WHERE id = NEW.product_id;
        END IF;
        RETURN NEW;

    ELSIF TG_OP = 'DELETE' THEN
        UPDATE products
        SET stock = stock + OLD.quantity
        WHERE id = OLD.product_id;
        RETURN OLD;
    END IF;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_orders_stock
BEFORE INSERT OR UPDATE OR DELETE ON orders
FOR EACH ROW
EXECUTE FUNCTION update_product_stock();

INSERT INTO products (name, stock)
VALUES ('Laptop', 10);

SELECT * FROM products;

INSERT INTO orders (product_id, quantity)
VALUES (1, 3);

SELECT * FROM products;

UPDATE orders
SET quantity = 5
WHERE id = 1;

SELECT * FROM products;

DELETE FROM orders
WHERE id = 1;

SELECT * FROM products;
