select c.*, sum(total_price) "total_revenue", count(c.customer_id) "order_count"
from orders o
         join customers c on o.customer_id = c.customer_id
group by c.customer_id
having sum(total_price) > 2000;

select c.*
from customers c
         join orders o on c.customer_id = o.customer_id
group by c.customer_id
having sum(total_price) >= (select avg(x.avg_total_revenue)
                            from (select sum(total_price) "avg_total_revenue"
                                  from customers c
                                           join orders o on c.customer_id = o.customer_id
                                  group by c.customer_id) x);

SELECT c.city, SUM(o.total_price) AS total_revenue
FROM customers c
         JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.city
HAVING SUM(o.total_price) = (SELECT MAX(city_revenue)
                             FROM (SELECT c.city, SUM(o.total_price) AS city_revenue
                                   FROM customers c
                                            JOIN orders o ON c.customer_id = o.customer_id
                                   GROUP BY c.city) AS t);

SELECT c.customer_name,
       c.city,
       SUM(oi.quantity)            AS total_products,
       SUM(o.total_price) AS total_spending
FROM customers c
         INNER JOIN orders o
                    ON c.customer_id = o.customer_id
         INNER JOIN order_items oi
                    ON o.order_id = oi.order_id
GROUP BY c.customer_id, c.customer_name, c.city;