SELECT e.employee_name AS 'Tên nhân viên', d.department_name AS 'Phòng ban', e.salary AS 'Lương'
FROM employees e
         JOIN departments d ON e.department_id = d.department_id;

SELECT SUM(salary) AS 'Tổng quỹ lương'
FROM employees;

SELECT AVG(salary) AS 'Lương trung bình'
FROM employees;

SELECT MAX(salary) AS 'Lương cao nhất', MIN(salary) AS 'Lương thấp nhất'
FROM employees;

SELECT COUNT(*) AS 'Số nhân viên'
FROM employees;

SELECT d.department_name,
       AVG(e.salary) AS avg_salary
FROM employees e
         JOIN departments d ON e.department_id = d.department_id
GROUP BY d.department_id
HAVING AVG(e.salary) > 15000000;

SELECT p.project_name,
       d.department_name,
       e.employee_name
FROM projects p
         JOIN departments d ON p.department_id = d.department_id
         JOIN employees e ON e.department_id = d.department_id;

SELECT *
FROM employees e
WHERE e.salary = (SELECT MAX(salary)
                  FROM employees
                  WHERE department_id = e.department_id);

SELECT department_id
FROM employees
UNION
SELECT department_id
FROM projects;

SELECT department_id
FROM employees
INTERSECT
SELECT department_id
FROM projects;
