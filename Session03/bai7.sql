CREATE SCHEMA sales;

CREATE TABLE Products
(
    product_id     SERIAL PRIMARY KEY,
    product_name   VARCHAR(255)   NOT NULL,
    price          NUMERIC(10, 2) NOT NULL,
    stock_quantity INTEGER DEFAULT 0
);

CREATE TABLE OrderDetails
(
    order_detail_id SERIAL PRIMARY KEY,
    order_id        INTEGER NOT NULL,
    product_id      INTEGER NOT NULL,
    quantity        INTEGER NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders (order_id),
    FOREIGN KEY (product_id) REFERENCES Products (product_id)
);

CREATE TABLE Orders
(
    order_id   SERIAL PRIMARY KEY,
    order_date DATE DEFAULT CURRENT_DATE,
    member_id  INTEGER NOT NULL,
    FOREIGN KEY (member_id) REFERENCES Members (member_id)
);
