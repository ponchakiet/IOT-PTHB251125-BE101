CREATE TABLE employees (
    id SERIAL PRIMARY KEY,
    name TEXT NOT NULL,
    position TEXT NOT NULL,
    salary NUMERIC(12, 2) NOT NULL
);

CREATE TABLE employees_log (
    id SERIAL PRIMARY KEY,
    employee_id INT,
    operation TEXT NOT NULL,
    old_data JSONB,       
    new_data JSONB,
    change_time TIMESTAMP DEFAULT NOW()
);

CREATE OR REPLACE FUNCTION log_employees_changes()
RETURNS TRIGGER AS $$
BEGIN
    IF TG_OP = 'INSERT' THEN
        INSERT INTO employees_log (
            employee_id,
            operation,
            old_data,
            new_data,
            change_time
        )
        VALUES (
            NEW.id,
            'INSERT',
            NULL,
            to_jsonb(NEW),
            NOW()
        );
        RETURN NEW;

    ELSIF TG_OP = 'UPDATE' THEN
        INSERT INTO employees_log (
            employee_id,
            operation,
            old_data,
            new_data,
            change_time
        )
        VALUES (
            NEW.id,
            'UPDATE',
            to_jsonb(OLD),
            to_jsonb(NEW),
            NOW()
        );
        RETURN NEW;

    ELSIF TG_OP = 'DELETE' THEN
        INSERT INTO employees_log (
            employee_id,
            operation,
            old_data,
            new_data,
            change_time
        )
        VALUES (
            OLD.id,
            'DELETE',
            to_jsonb(OLD),
            NULL,
            NOW()
        );
        RETURN OLD;
    END IF;

    RETURN NULL;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER trg_employees_log
AFTER INSERT OR UPDATE OR DELETE ON employees
FOR EACH ROW
EXECUTE FUNCTION log_employees_changes();

INSERT INTO employees (name, position, salary)
VALUES ('Nguyen Van A', 'Developer', 15000000);

UPDATE employees
SET salary = 18000000
WHERE name = 'Nguyen Van A';

DELETE FROM employees
WHERE name = 'Nguyen Van A';

SELECT * FROM employees_log;
