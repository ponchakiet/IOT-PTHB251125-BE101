create or replace procedure calculate_total_sales(start_date DATE, end_date DATE, OUT total NUMERIC)
    language plpgsql
as
$$
begin
    select sum(amount) into total from sales where sale_date between start_date and end_date;
end;
$$;

call calculate_total_sales('2025-12-01', '2025-12-10', total);