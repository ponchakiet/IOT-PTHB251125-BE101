set search_path to session04;

CREATE TABLE students
(
    id    SERIAL PRIMARY KEY,
    name  VARCHAR(50),
    age   INT,
    major VARCHAR(50),
    gpa   DECIMAL(3, 2)
);

INSERT INTO students (name, age, major, gpa)
VALUES ('An', 20, 'CNTT', 3.5),
       ('Bình', 21, 'Toán', 3.2),
       ('Cường', 22, 'CNTT', 3.8),
       ('Dương', 20, 'Vật lý', 3.0),
       ('Em', 21, 'CNTT', 2.9);

INSERT INTO students (name, age, major, gpa)
VALUES ('Hùng', 23, 'Hóa học', 3.4);

update students
set gpa = 3.6
where name = 'Bình';

delete
from students
where gpa < 3.0;

select name, major
from students
order by gpa desc;

select distinct name
from students
where major = 'CNTT';

select *
from students
where gpa between 3.0 and 3.6;

select *
from students
where name ilike 'c%';

select *
from students
order by id
limit 3;

select *
from students
order by id
limit 3
offset 1;