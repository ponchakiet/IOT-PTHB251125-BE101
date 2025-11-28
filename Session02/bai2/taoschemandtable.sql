create schema university;

set search_path to university;

create table Students
(
    student_id serial primary key,
    first_name varchar(50) not null,
    last_name  varchar(50) not null,
    birth_date date,
    email      text        not null unique
);

create table Courses
(
    course_id serial primary key ,
    course_name varchar(100) not null ,
    credits int
);

create table Enrollments(
    erollment_id serial primary key ,
    student_id int ,
    course_id int ,
    enroll_date date ,
    constraint fk1 foreign key (student_id) references Students(student_id) ,
    constraint fk2 foreign key (course_id) references Courses(course_id)
);
