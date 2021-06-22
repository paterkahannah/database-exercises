-- 2. Update your queries for employees whose names start and end with 'E'. Use concat() to combine their first and last name together as a single column in your results.
SELECT CONCAT (first_name, ' ', last_name)
FROM employees
WHERE last_name LIKE 'e%e';

-- 3. Find all employees born on Christmas — 842 rows.
SELECT *
FROM employees
WHERE MONTH(birth_date) = 12
    AND DAY(birth_date) = 25;

-- 4. Find all employees hired in the 90s and born on Christmas — 362 rows.
SELECT *
FROM employees
WHERE YEAR(hire_date) BETWEEN 1990 AND 1999
    AND MONTH(birth_date) = 12
    AND DAY(birth_date) = 25;

-- 5. Change the query for employees hired in the 90s and born on Christmas such that the first result is the oldest employee who was hired last. It should be Khun Bernini.
SELECT *
FROM employees
WHERE YEAR(hire_date) LIKE '199%'
    AND MONTH(birth_date) = 12
    AND DAY(birth_date) = 25
ORDER BY birth_date, hire_date DESC;

-- 6. For your query of employees born on Christmas and hired in the 90s, use datediff() to find how many days they have been working at the company (Hint: You might also need to use now() or curdate()).
SELECT *, DATEDIFF(now(), hire_date) AS 'Days of Employment'
FROM employees
WHERE YEAR(hire_date) like '199%'
    AND MONTH(birth_date) = 12
    AND DAY(birth_date) = 25
ORDER BY first_name;
