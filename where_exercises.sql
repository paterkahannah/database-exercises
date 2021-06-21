-- exercise part 1
-- 2. Find all employees with first names 'Irena', 'Vidya', or 'Maya' — 709 rows (Hint: Use IN).
SELECT * FROM employees WHERE first_name IN ('Irena', 'Vidya', 'Maya');

-- 3. Find all employees whose last name starts with 'E' — 7,330 rows.
SELECT * FROM employees WHERE last_name LIKE 'E%';

-- 4. Find all employees with a 'q' in their last name — 1,873 rows.
SELECT * FROM employees WHERE last_name LIKE '%q%';

-- exercise part 2
-- 1. Update your query for 'Irena', 'Vidya', or 'Maya' to use OR instead of IN — 709 rows.
SELECT * FROM employees WHERE (first_name = 'Irena'
OR first_name = 'Vidya'
OR first_name = 'Maya')
-- 2. Add a condition to the previous query to find everybody with those names who is also male — 441 rows.
AND gender = 'm';

-- 3. Find all employees whose last name starts or ends with 'E' — 30,723 rows.
SELECT * FROM employees WHERE last_name LIKE 'e%' OR last_name LIKE '%e';

-- 4. Duplicate the previous query and update it to find all employees whose last name starts and ends with 'E' — 899 rows.
SELECT * FROM employees WHERE last_name LIKE 'e%e';

-- 5. Find all employees with a 'q' in their last name but not 'qu' — 547 rows.
SELECT * FROM employees WHERE last_name LIKE '%q%' AND last_name NOT LIKE '%qu%';

-- NOTES:
SELECT * FROM employees WHERE hire_date = '1985-01-01';

SELECT first_name FROM employees WHERE first_name LIKE '%sus%';

SELECT emp_no, first_name ,last_name FROM employees WHERE emp_no BETWEEN 10026 AND 10082;

SELECT emp_no, first_name ,last_name FROM employees WHERE last_name IN ('Shridhar');

SELECT emp_no, first_name ,last_name FROM employees
WHERE emp_no < 20000 AND last_name IN ('Herber', 'Baek')
OR first_name = 'Shridhar';

SELECT * FROM salaries WHERE salary NOT BETWEEN 50000 AND 100000; -- # both these work
SELECT * FROM salaries WHERE NOT salary BETWEEN 50000 AND 100000; -- # both these work

SELECT birth_date FROM employees
WHERE NOT birth_date LIKE '195%';
