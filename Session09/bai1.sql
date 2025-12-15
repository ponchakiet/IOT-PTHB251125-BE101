create index idx_customerid on orders(customer_id)

explain analyze SELECT * FROM orders WHERE customer_id = X;