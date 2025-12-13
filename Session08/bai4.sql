create or replace procedure calculate_discount(p_id int, out p_final_price numeric)
    language plpgsql
as
$$
declare current_price numeric;
    current_discount_percent int;
begin
    select price, discount_percent into current_price, current_discount_percent
    from products
    where id = p_id;

    if current_discount_percent>50 then
        current_discount_percent:=50;
    end if;
    p_final_price := current_price*(current_price*current_discount_percent/100);
    update products
    set price = p_final_price
    where id = p_id;
end;
$$;

call calculate_discount(2, p_final_price)
select p_final_price;