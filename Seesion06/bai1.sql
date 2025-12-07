insert into products (name, name, price, stock)
values ('Laptop Gaming ABC', 'Điện tử', 25000000.00, 15),
       ('Áo Thun Cotton', 'Thời trang', 350000.00, 150),
       ('Bàn Phím Cơ', 'Điện tử', 2900000.00, 45),
       ('Sách Lập Trình Python', 'Sách', 180000.00, 200),
       ('Ghế Văn Phòng Cao Cấp', 'Nội thất', 4500000.00, 8);

select *
from products;

select name, price
from products
order by price desc
limit 3;

select ame, name, price
from products
where name = 'Điện tử' and price < 10000000.00;

select name, stock
from products
order by stock asc;