BEGIN;
DO $$
DECLARE
    stock1 INT;
    stock2 INT;
    total NUMERIC(10,2);
    order_id_new INT;
BEGIN
    SELECT stock INTO stock1 FROM products WHERE product_id = 1;
    SELECT stock INTO stock2 FROM products WHERE product_id = 2;
    IF stock1 >= 2 AND stock2 >= 1 THEN
        INSERT INTO orders(customer_name) VALUES('Nguyen Van A') RETURNING order_id INTO order_id_new;
        UPDATE products SET stock = stock - 2 WHERE product_id = 1;
        UPDATE products SET stock = stock - 1 WHERE product_id = 2;
        INSERT INTO order_items(order_id, product_id, quantity, price) VALUES(order_id_new, 1, 2, 100.00);
        INSERT INTO order_items(order_id, product_id, quantity, price) VALUES(order_id_new, 2, 1, 200.00);
        SELECT SUM(quantity*price) INTO total FROM order_items WHERE order_id = order_id_new;
        UPDATE orders SET total_amount = total WHERE order_id = order_id_new;
    ELSE
        RAISE EXCEPTION 'Not enough stock';
    END IF;
END
$$;
COMMIT;

SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM order_items;

UPDATE products SET stock = 0 WHERE product_id = 2;

BEGIN;
DO $$
DECLARE
    stock1 INT;
    stock2 INT;
    total NUMERIC(10,2);
    order_id_new INT;
BEGIN
    SELECT stock INTO stock1 FROM products WHERE product_id = 1;
    SELECT stock INTO stock2 FROM products WHERE product_id = 2;
    IF stock1 >= 2 AND stock2 >= 1 THEN
        INSERT INTO orders(customer_name) VALUES('Nguyen Van A') RETURNING order_id INTO order_id_new;
        UPDATE products SET stock = stock - 2 WHERE product_id = 1;
        UPDATE products SET stock = stock - 1 WHERE product_id = 2;
        INSERT INTO order_items(order_id, product_id, quantity, price) VALUES(order_id_new, 1, 2, 100.00);
        INSERT INTO order_items(order_id, product_id, quantity, price) VALUES(order_id_new, 2, 1, 200.00);
        SELECT SUM(quantity*price) INTO total FROM order_items WHERE order_id = order_id_new;
        UPDATE orders SET total_amount = total WHERE order_id = order_id_new;
    ELSE
        RAISE EXCEPTION 'Not enough stock';
    END IF;
END
$$;
ROLLBACK;

SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM order_items;