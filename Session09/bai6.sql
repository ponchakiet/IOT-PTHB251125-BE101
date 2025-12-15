create or replace procedure update_product_price(p_category_id INT, p_increase_percent NUMERIC)
    language plpgsql
as
$$
begin
    update products
    set price = price * (1+p_increase_percent/100)
    where category_id = p_category_id;
end;
$$;

call update_product_price(1, 10)