create schema sales;

set search_path to sales;

create table Customers
(
    customer_id serial primary key,
    first_name  varchar(50)  not null,
    last_name   varchar(50)  not null,
    email       varchar(255) not null unique,
    phone       varchar(20)
);

create table Products
(
    product_id     serial primary key,
    product_name   varchar(100)   not null,
    price          numeric(10, 2) not null,
    stock_quantity integer        not null
);

create table Orders
(
    order_id    serial primary key,
    customer_id integer not null references Customers (customer_id),
    order_date  date    not null
);

create table OrderItems
(
    order_item_id serial primary key,
    order_id      integer not null references Orders (order_id),
    product_id    integer not null references Products (product_id),
    quantity      integer not null check (quantity >= 1)
);