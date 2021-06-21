-- exercise part 1
-- 2. Find all employees with first names 'Irena', 'Vidya', or 'Maya' — 709 rows (Hint: Use IN).
select * from employees where first_name in ('Irena', 'Vidya', 'Maya');

-- 3. Find all employees whose last name starts with 'E' — 7,330 rows.
select * from employees where last_name like 'E%';

-- 4. Find all employees with a 'q' in their last name — 1,873 rows.
select * from employees where last_name like '%q%';

-- exercise part 2
-- 1. Update your query for 'Irena', 'Vidya', or 'Maya' to use OR instead of IN — 709 rows.
 select * from employees where (first_name = 'Irena'
 or first_name = 'Vidya'
 or first_name = 'Maya')
-- 2. Add a condition to the previous query to find everybody with those names who is also male — 441 rows.
 and gender = 'm';

-- 3. Find all employees whose last name starts or ends with 'E' — 30,723 rows.
select * from employees where last_name like 'e%' or last_name like '%e';

-- 4. Duplicate the previous query and update it to find all employees whose last name starts and ends with 'E' — 899 rows.
select * from employees where last_name like 'e%' and last_name like '%e';

-- 5. Find all employees with a 'q' in their last name but not 'qu' — 547 rows.
select * from employees where last_name like '%q%' and last_name not like '%qu%';

-- NOTES:
select * from employees where hire_date = '1985-01-01';

select first_name from employees where first_name like '%sus%';

select emp_no, first_name ,last_name from employees where emp_no between 10026 and 10082;

select emp_no, first_name ,last_name from employees where last_name in ('Shridhar');

select emp_no, first_name ,last_name from employees
where emp_no < 20000 and last_name in ('Herber', 'Baek')
   or first_name = 'Shridhar';

select * from salaries where salary not between 50000 and 100000; # both these work
select * from salaries where not salary between 50000 and 100000; # both these work

SELECT birth_date FROM employees
WHERE NOT birth_date LIKE '195%';
