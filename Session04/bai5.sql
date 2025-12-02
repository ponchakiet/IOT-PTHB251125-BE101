set search_path to session04;

CREATE TABLE employees
(
    id         SERIAL PRIMARY KEY,
    full_name  VARCHAR(255) NOT NULL,
    department VARCHAR(50)  NOT NULL,
    position   VARCHAR(50)  NOT NULL,
    salary     BIGINT       NOT NULL,
    bonus      BIGINT,
    join_year  INT          NOT NULL
);

INSERT INTO employees (full_name, department, position, salary, bonus, join_year)
VALUES ('Nguyễn Văn Huy', 'IT', 'Developer', 18000000, 1000000, 2021),
       ('Trần Thị Mai', 'HR', 'Recruiter', 12000000, NULL, 2020),
       ('Lê Quốc Trung', 'IT', 'Tester', 15000000, 800000, 2023),
       ('Nguyễn Văn Huy', 'IT', 'Developer', 18000000, 1000000, 2021),
       ('Phạm Ngọc Hân', 'Finance', 'Accountant', 14000000, NULL, 2019),
       ('Bùi Thị Lan', 'HR', 'HR Manager', 20000000, 3000000, 2018),
       ('Đặng Hữu Tài', 'IT', 'Developer', 17000000, NULL, 2022);

DELETE
FROM employees
WHERE id = 4;

update employees
set salary = salary*1.1
where salary < 18000000;

update employees
set bonus = 500000
where bonus is null;

select *
from employees
where (department = 'IT' or department = 'HR') and join_year > 2020 and (salary + bonus) = 15000000;

select *, (salary + bonus) as total_income
from employees
order by total_income desc
limit 3;

select *
from employees
where full_name ilike 'nguyễn%' or full_name ilike '%hân';

select distinct department
from employees
where bonus is not null;

select *
from employees
where join_year between 2019 and 2022;