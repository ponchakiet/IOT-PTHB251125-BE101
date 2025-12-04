SELECT c.customer_name AS "Tên khách",
       o.order_date    AS "Ngày đặt hàng",
       o.total_amount  AS "Tổng tiền"
FROM orders o
         JOIN customers c ON o.customer_id = c.customer_id;

SELECT SUM(total_amount) AS tong_doanh_thu,
       AVG(total_amount) AS trung_binh_don_hang,
       MAX(total_amount) AS don_hang_lon_nhat,
       MIN(total_amount) AS don_hang_nho_nhat,
       COUNT(order_id)   AS so_luong_don_hang
FROM orders;

select c.city, sum(total_amount) "doanh thu"
from customers c
         join orders o on c.customer_id = o.customer_id
group by c.city
having sum(total_amount) > 10000;

SELECT c.customer_name,
       o.order_date,
       oi.product_name,
       oi.quantity,
       oi.price
FROM customers c
         JOIN orders o ON c.customer_id = o.customer_id
         JOIN order_items oi ON o.order_id = oi.order_id
ORDER BY o.order_date;

SELECT c.customer_name
FROM customers c
         JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_name
having SUM(o.total_amount) = (SELECT MAX(customer_total)
                              FROM (SELECT SUM(total_amount) AS customer_total
                                    FROM orders
                                    GROUP BY customer_id) AS t);

SELECT city
FROM customers
UNION
SELECT city
FROM customers c
         JOIN orders o ON c.customer_id = o.customer_id;

SELECT city
FROM customers
INTERSECT
SELECT city
FROM customers c
         JOIN orders o ON c.customer_id = o.customer_id;

