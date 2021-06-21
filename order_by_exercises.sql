-- 2. Modify your first query to order by first name. The first result should be Irena Reutenauer and the last result should be Vidya Demeyer.
SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name;

-- 3. Update the query to order by first name and then last name. The first result should now be Irena Acton and the last should be Vidya Boguraev.
SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name, last_name;

-- 4. Change the ORDER BY clause so that you order by last name before first name. Your first result should still be Irena Acton but now the last result should be Vidya Quittner.
SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY last_name, first_name;

-- 5. Update your queries for employees with 'E' in their last name to sort the results by their employee number. Your results should not change!
SELECT *
FROM employees
WHERE last_name LIKE 'e%e';

SELECT *
FROM employees
WHERE last_name LIKE 'e%e'
ORDER BY emp_no;

SELECT *
FROM employees
WHERE last_name LIKE 'E%';

SELECT *
FROM employees
WHERE last_name LIKE 'E%'
ORDER BY emp_no;

SELECT *
FROM employees
WHERE last_name LIKE 'e%'
    OR last_name LIKE '%e';

SELECT *
FROM employees
WHERE last_name LIKE 'e%'
    OR last_name LIKE '%e'
ORDER BY emp_no;

-- 6. Now reverse the sort order for both queries and compare results.
SELECT *
FROM employees
WHERE last_name LIKE 'e%e'
ORDER BY emp_no DESC;

SELECT *
FROM employees
WHERE last_name LIKE 'E%'
ORDER BY emp_no DESC;

SELECT *
FROM employees
WHERE last_name LIKE 'e%'
    OR last_name LIKE '%e'
ORDER BY emp_no DESC;
