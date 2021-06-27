SELECT *
FROM employees
WHERE hire_date = (
    SELECT hire_date
    FROM employees
    WHERE emp_no = 101010
    );

SELECT title, first_name
FROM titles
    JOIN employees
        ON employees.emp_no = titles.emp_no
WHERE first_name = (
    SELECT first_name
    FROM employees
    WHERE first_name = 'Aamod'
);