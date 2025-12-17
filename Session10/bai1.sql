CREATE TABLE products (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    price NUMERIC(10, 2) NOT NULL,
    last_modified TIMESTAMP
);

CREATE OR REPLACE FUNCTION update_last_modified()
RETURNS TRIGGER AS $$
BEGIN
    NEW.last_modified := NOW();
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_update_last_modified
BEFORE UPDATE ON products
FOR EACH ROW
EXECUTE FUNCTION update_last_modified();

INSERT INTO products (name, price)
VALUES
    ('Coffee', 25000),
    ('Milk Tea', 30000),
    ('Orange Juice', 28000);

SELECT * FROM products;
UPDATE products
SET price = 27000
WHERE name = 'Coffee';

SELECT * FROM products WHERE name = 'Coffee';