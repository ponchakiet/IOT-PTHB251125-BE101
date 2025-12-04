select p.category, sum(o.total_price) "total_sales", sum(o.quantity) "total_quantity"
from products p
         join orders o on p.product_id = o.product_id
group by category
having sum(o.total_price) > 2000
order by sum(o.total_price) desc;