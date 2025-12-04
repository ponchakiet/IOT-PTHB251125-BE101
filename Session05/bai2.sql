select p.product_name, sum(total_price) "total_revenue"
from products p
         join orders o on p.product_id = o.product_id
group by p.product_name
order by total_revenue desc
limit 1;

select p.category, sum(total_price) "total_revenue"
from products p
         join orders o on o.product_id = p.product_id
group by category;

(SELECT p.category
 FROM products p
          JOIN
      orders o ON p.product_id = o.product_id
 GROUP BY p.category
 HAVING SUM(o.quantity) = (SELECT MAX(TotalQuantityByCategory)
                           FROM (SELECT SUM(o2.quantity) AS TotalQuantityByCategory
                                 FROM orders o2
                                          JOIN
                                      products p2 ON o2.product_id = p2.product_id
                                 GROUP BY p2.category) AS MaxCategoryQuantity))
INTERSECT
(SELECT p.category
 FROM products p
          JOIN
      orders o ON p.product_id = o.product_id
 GROUP BY p.category
 HAVING SUM(o.total_price) > 3000);