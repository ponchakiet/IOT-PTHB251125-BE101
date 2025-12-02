CREATE DATABASE CompanyDB;

create schema Company;
CREATE TABLE Departments
(
    department_id   SERIAL PRIMARY KEY,
    department_name VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE Employees
(
    emp_id        SERIAL PRIMARY KEY,
    name          VARCHAR(150) NOT NULL,
    dob           DATE,
    department_id INTEGER      NOT NULL,
    FOREIGN KEY (department_id) REFERENCES Departments (department_id)
);

CREATE TABLE Projects
(
    project_id   SERIAL PRIMARY KEY,
    project_name VARCHAR(200) UNIQUE NOT NULL,
    start_date   DATE                NOT NULL,
    end_date     DATE,
    CHECK (end_date IS NULL OR end_date >= start_date)
);

CREATE TABLE EmployeeProjects
(
    emp_id     INTEGER NOT NULL,
    project_id INTEGER NOT NULL,
    PRIMARY KEY (emp_id, project_id),
    FOREIGN KEY (emp_id) REFERENCES Employees (emp_id),
    FOREIGN KEY (project_id) REFERENCES Projects (project_id)
);