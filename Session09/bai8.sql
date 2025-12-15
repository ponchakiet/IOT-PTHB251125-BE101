create or replace procedure add_order_and_update_customer(p_customer_id INT, p_amount NUMERIC)
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
    end if;
    begin
        INSERT INTO orders(customer_id, amount)
        VALUES (p_customer_id, p_amount);

        update customers
        set total_spent = total_spent + p_amount
        where customer_id = p_customer_id;
    exception
        when others then
            RAISE EXCEPTION 'Loi khi tao don hang voi id khach hang %', p_customer_id;
    end;
end;
$$;

CALL add_order_and_update_customer(1, 500);