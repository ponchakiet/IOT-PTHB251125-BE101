create or replace procedure adjust_salary(p_emp_id int, out p_new_salary numeric)
    language plpgsql
AS
$$
declare
    current_level int;
    current_salary numeric;
BEGIN
    select salary, job_level into current_salary, current_level from employees where emp_id = p_emp_id;

    if current_level = 1 then
        p_new_salary := current_salary*1.05;
    elsif current_level = 2 then
        p_new_salary := current_salary*1.1;
    else
        p_new_salary := current_salary*1.15;
    end if;

    update employees
    set salary = p_new_salary
    where emp_id = p_emp_id;
END;
$$;

call adjust_salary(3, p_new_salary);
select p_new_salary;