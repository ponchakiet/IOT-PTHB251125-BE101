create or replace procedure add_order(p_customer_id INT, p_amount NUMERIC)
    language plpgsql
as
$$
declare
    v_exists boolean;
begin
    select exists(select 1 from customers where customer_id = p_customer_id)
    into v_exists;
    if not v_exists then
        RAISE EXCEPTION 'Khach hang khong ton tai';
    else
        INSERT INTO orders(customer_id, amount)
        VALUES (p_customer_id, p_amount);
    end if;
end;
$$;

call add_order(1, 100)