create or replace procedure calculate_order_total(order_id_input int, out total numeric)
    language plpgsql
AS
$$
BEGIN
    select sum(quantity * unit_price) into total from order_detail od join order o on od.order_id=o.id where id = order_id_input;
END;
$$;

call calculate_order_total(1, null);