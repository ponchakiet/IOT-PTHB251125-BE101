create or replace procedure check_stock(p_id int, p_qty int)
    language plpgsql
AS
$$
    declare current_quantity int;
BEGIN
        select quantity into current_quantity where  product_id = p_id;

        if current_quantity < p_qty then
            raise exception 'Không đủ hàng trong kho';
        else
            raise notice 'Đủ hàng';
        end if;
END;
$$;

call check_stock(1, 20);
call check_stock(2, 50);