create table customers
(
    customer_id serial primary key,
    name        varchar(50),
    email       varchar(50)
);

create table customer_log
(
    log_id        serial primary key,
    customer_name varchar(50),
    action_time   timestamp
);

create or replace function trg1()
    returns trigger
as
$$
begin
    insert into customer_log (customer_name, action_time)
    values (new.name, current_timestamp);
    return new;
end;
$$ language plpgsql;

create or replace trigger add_customer_log
    after insert
    on customers
    for each row
execute function trg1();