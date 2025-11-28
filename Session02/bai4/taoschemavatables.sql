create schema elearning;

set search_path to elearning;

create table Students
(
    student_id serial primary key,
    first_name varchar(50)  not null,
    last_name  varchar(50)  not null,
    email      varchar(255) not null unique
);

create table Instructors
(
    instructor_id serial primary key,
    first_name    varchar(50)  not null,
    last_name     varchar(50)  not null,
    email         varchar(255) not null unique
);

create table Courses
(
    course_id     serial primary key,
    course_name   varchar(100) not null,
    instructor_id integer      not null references Instructors (instructor_id)
);

create table Enrollments
(
    enrollment_id serial primary key,
    student_id    integer not null references Students (student_id),
    course_id     integer not null references Courses (course_id),
    enroll_date   date    not null
);

create table Assignments
(
    assignment_id serial primary key,
    course_id     integer      not null references Courses (course_id),
    title         varchar(100) not null,
    due_date      date         not null
);

create table Submissions
(
    submission_id   serial primary key,
    assignment_id   integer not null references Assignments (assignment_id),
    student_id      integer not null references Students (student_id),
    submission_date date    not null,
    grade           numeric(4, 1) check (grade >= 0 and grade <= 100)
);