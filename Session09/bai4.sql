create view CustomerSales as
select sum(amount) as total_amount
from sales
group by customer_id;

SELECT * FROM CustomerSales WHERE total_amount > 1000;

UPDATE CustomerSales
SET total_amount = 2000
WHERE customer_id = 1;