create or replace procedure update_employee_status(p_emp_id int, out p_status text)
    language plpgsql
as
$$
declare
    salary_var numeric(10, 2);
begin
    if ((select count(*)
         from employee
         where id = p_emp_id) = 0) then
        raise exception 'Employee not found';
    end if;
    select salary into salary_var from employee where id = p_emp_id;
    p_status := case
                    when salary_var < 5000 then 'Junior'
                    when salary_var < 10000 then 'Middle'
                    else 'Senior'
        end;
end;
$$;

call update_employee_status(1, null);
call update_employee_status(3, null);