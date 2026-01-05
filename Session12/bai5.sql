DROP TABLE IF EXISTS employee_log;
DROP TABLE IF EXISTS employees;

CREATE TABLE employees (
    employee_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(100),
    position VARCHAR(100),
    salary NUMERIC(10,2)
);

CREATE TABLE employee_log (
    log_id SERIAL PRIMARY KEY,
    employee_name VARCHAR(100),
    changed_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO employees (employee_name, position, salary)
VALUES
('Nguyen Van A', 'Developer', 1000),
('Tran Thi B', 'Tester', 800);

CREATE OR REPLACE FUNCTION log_employee_update()
RETURNS TRIGGER AS $$
BEGIN
    INSERT INTO employee_log (employee_name)
    VALUES (NEW.employee_name);
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER after_update_employees
AFTER UPDATE ON employees
FOR EACH ROW
EXECUTE FUNCTION log_employee_update();

UPDATE employees
SET salary = 1200
WHERE employee_id = 1;

SELECT * FROM employee_log;
