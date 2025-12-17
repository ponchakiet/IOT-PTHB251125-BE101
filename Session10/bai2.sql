CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    credit_limit NUMERIC(12, 2) NOT NULL
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL REFERENCES customers(id),
    order_amount NUMERIC(12, 2) NOT NULL
);

CREATE OR REPLACE FUNCTION check_credit_limit()
RETURNS TRIGGER AS $$
DECLARE
    total_order_amount NUMERIC(12, 2);
    customer_limit NUMERIC(12, 2);
BEGIN
    -- Lấy tổng đơn hàng hiện tại của khách hàng
    SELECT SUM(order_amount)
    INTO total_order_amount
    FROM orders
    WHERE customer_id = NEW.customer_id;

    SELECT credit_limit
    INTO customer_limit
    FROM customers
    WHERE id = NEW.customer_id;

    IF total_order_amount + NEW.order_amount > customer_limit THEN
        RAISE EXCEPTION
            'Credit limit exceeded. Current: %, New order: %, Limit: %',
            total_order_amount, NEW.order_amount, customer_limit;
    END IF;

    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_check_credit
BEFORE INSERT ON orders
FOR EACH ROW
EXECUTE FUNCTION check_credit_limit();

INSERT INTO customers (name, credit_limit)
VALUES
    ('Alice', 100000),
    ('Bob', 50000);

INSERT INTO orders (customer_id, order_amount)
VALUES
    (1, 30000),
    (1, 40000),
    (2, 20000);

SELECT * FROM orders;


INSERT INTO orders (customer_id, order_amount)
VALUES
    (1, 40000);
