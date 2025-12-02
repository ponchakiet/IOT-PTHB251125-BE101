CREATE DATABASE SchoolDB;

create schema students;
CREATE TABLE Students
(
    student_id SERIAL PRIMARY KEY,
    name       VARCHAR(150) NOT NULL,
    dob        DATE
);

CREATE TABLE Courses
(
    course_id   SERIAL PRIMARY KEY,
    course_name VARCHAR(100) NOT NULL,
    credits     INTEGER      NOT NULL
);

CREATE TABLE Enrollments
(
    enrollment_id SERIAL PRIMARY KEY,
    student_id    INTEGER NOT NULL,
    course_id     INTEGER NOT NULL,
    grade         CHAR(1),
    FOREIGN KEY (student_id) REFERENCES Students (student_id),
    FOREIGN KEY (course_id) REFERENCES Courses (course_id),
    CHECK (grade IN ('A', 'B', 'C', 'D', 'F'))
);