-- shows each department along with the name of the current manager for that department.
SELECT departments.dept_name AS 'Department Name', CONCAT(employees.first_name, ' ', employees.last_name) AS 'Department Manager'
FROM employees
         JOIN dept_manager
              ON dept_manager.emp_no = employees.emp_no
         JOIN departments
              ON departments.dept_no = dept_manager.dept_no
WHERE dept_manager.to_date = '9999-01-01'
ORDER BY departments.dept_name;

-- Find the name of all departments currently managed by women.
SELECT departments.dept_name AS 'Department Name', CONCAT(employees.first_name, ' ', employees.last_name) AS 'Department Manager'
FROM employees
         JOIN dept_manager
              ON dept_manager.emp_no = employees.emp_no
         JOIN departments
              ON departments.dept_no = dept_manager.dept_no
WHERE dept_manager.to_date = '9999-01-01' AND employees.gender = 'f';
ORDER BY departments.dept_name;

-- -- Find the current titles of employees currently working in the Customer Service department.
SELECT titles.title AS title, COUNT(*) AS Total
FROM titles
         JOIN dept_emp
              ON titles.emp_no = dept_emp.emp_no
WHERE dept_emp.dept_no = 'd009' AND titles.to_date = '9999-01-01' AND dept_emp.to_date = '9999-01-01'
GROUP BY title;

-- Find the current salary of all current managers.
SELECT departments.dept_name AS 'Department Name', CONCAT(employees.first_name, ' ', employees.last_name) AS 'Department Manager', salaries.salary
FROM employees
         JOIN dept_manager
              ON dept_manager.emp_no = employees.emp_no
         JOIN departments
              ON departments.dept_no = dept_manager.dept_no
         JOIN salaries
              ON salaries.emp_no = employees.emp_no
WHERE dept_manager.to_date = '9999-01-01' AND salaries.to_date = '9999-01-01'
ORDER BY departments.dept_name;

-- -- Bonus Find the names of all current employees, their department name, and their current manager's name .
-- SELECT CONCAT(employees.first_name, ' ', employees.last_name) AS Employee, departments.dept_name AS Department, CONCAT(employees.first_name, ' ', employees.last_name) AS Manager
-- FROM dept_emp
--          JOIN employees
--                   ON employees.emp_no = dept_emp.emp_no
--          JOIN departments
--               ON departments.dept_no = dept_emp.dept_no
--          JOIN dept_manager
--               ON dept_manager.emp_no = employees.emp_no
--
-- --          JOIN salaries
-- --               ON salaries.emp_no = employees.emp_no
-- WHERE dept_emp.to_date = '9999-01-01'
-- ORDER BY departments.dept_name
-- LIMIT 50;
