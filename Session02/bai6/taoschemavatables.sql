create schema shop;

set search_path to shop;

create table Users
(
    user_id  serial primary key,
    username varchar(50) unique  not null,
    email    varchar(100) unique not null,
    password varchar(100)        not null,
    role     varchar(20) check (role in ('Customer', 'Admin'))
);

create table Categories
(
    category_id   serial primary key,
    category_name varchar(100) unique not null
);

create table Products
(
    product_id   serial primary key,
    product_name varchar(100) not null,
    price        numeric(10, 2) check (price > 0),
    stock        integer check (stock >= 0),
    category_id  integer references Categories (category_id)
);

create table Orders
(
    order_id   serial primary key,
    user_id    integer not null references Users (user_id),
    order_date date    not null,
    status     varchar(20) check (status in ('Pending', 'Shipped', 'Delivered', 'Cancelled'))
);

create table Orderdetails
(
    order_detail_id serial,
    order_id        integer        not null references Orders (order_id),
    product_id      integer        not null references Products (product_id),
    quantity        integer        not null check (quantity > 0),
    price_each      numeric(10, 2) not null check (price_each > 0),
    primary key (order_detail_id, order_id, product_id)
);

create table Payments
(
    payment_id   serial primary key,
    order_id     integer not null unique references Orders (order_id),
    amount       numeric(10, 2) check (amount >= 0),
    payment_date date    not null,
    method       varchar(30) check (method in ('Credit Card', 'Momo', 'Bank Transfer', 'Cash'))
);