SELECT *
FROM parks_and_recreation.employee_demographics
WHERE (first_name ='Leslie' AND age = 44) or age > 55
;
SELECT *
FROM parks_and_recreation.employee_salary
WHERE salary <= 50000
;
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE gender != 'Female'
;
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE birth_date > '1985-01-01'
OR NOT gender = 'male'
;
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE birth_date LIKE '1989%'
;
SELECT gender, AVG(age), MAX(age),MIN(age),COUNT(age)
FROM parks_and_recreation.employee_demographics
GROUP BY gender
;
SELECT occupation, salary
FROM employee_salary
GROUP BY occupation, salary
;
SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY 5, 4
;

SELECT occupation, AVG(salary)
FROM parks_and_recreation.employee_salary
WHERE occupation LIKE '%manager%'
GROUP BY occupation
HAVING AVG(salary)
;
SELECT gender, avg(age) avg_age
FROM parks_and_recreation.employee_demographics
group by gender;
HAVING avg_age > 40
;
SELECT *
FROM parks_and_recreation.employee_demographics
;
SELECT *
FROM parks_and_recreation.employee_salary
;
SELECT dem.employee_id, age, occupation
FROM parks_and_recreation.employee_demographics as dem
INNER JOIN employee_salary as sal
 ON dem.employee_id = sal.employee_id
;
SELECT *
FROM parks_and_recreation.employee_demographics as dem
RIGHT OUTER JOIN employee_salary as sal
 ON dem.employee_id = sal.employee_id
;
SELECT emp1.employee_id AS emp_santa,
emp1.first_name AS first_name_santa,
emp1.last_name AS last_name_santa,
emp2.employee_id as emp_santa,
emp2.first_name AS first_name_santa,
emp2.last_name AS last_name_santa
FROM employee_salary emp1
JOIN employee_salary emp2
 ON emp1.employee_id + 1 = emp2.employee_id
;
SELECT *
FROM parks_and_recreation.employee_demographics as dem
INNER JOIN employee_salary as sal
 ON dem.employee_id = sal.employee_id
 INNER JOIN parks_departments pd
 ON sal.dept_id = pd.department_id
;

SELECT *
FROM parks_and_recreation.parks_departments
;

SELECT first_name, last_name
FROM parks_and_recreation.employee_demographics
UNION ALL
SELECT first_name, last_name
FROM parks_and_recreation.employee_salary
;
SELECT first_name, last_name, 'Old Man' AS Label
FROM parks_and_recreation.employee_demographics
WHERE age > 40 AND gender = 'Male'
UNION
SELECT first_name, last_name, 'Old Lady' AS Label
FROM parks_and_recreation.employee_demographics
WHERE age > 40 AND gender = 'Female'
UNION
SELECT first_name, last_name, 'Highly Paid Employee' AS Label
FROM parks_and_recreation.employee_salary
WHERE salary > 70000
ORDER BY first_name, last_name
;
SELECT first_name, UPPER(first_name)
FROM employee_demographics
ORDER BY 2;

SELECT UPPER('sky');
SELECT LOWER('sky');

SELECT RTRIM('                          sky                    ');

SELECT first_name, 
LEFT(first_name, 4),
right(first_name, 4),
substring(first_name,3,2),
birth_date,
substring(birth_date,6,2) as birth_month
FROM employee_demographics;
SELECT first_name, REPLACE(first_name, 'a','z')
FROM employee_demographics;


SELECT first_name, last_name,
CONCAT(first_name,' ',last_name) AS full_name
FROM employee_demographics;

SELECT first_name, 
last_name,
case
     when age <= 30 then 'Young'
     when age between 31 and 50 THEN 'OLD'
     when age >=50 Then "On Death's Door"
	end as age_bracket
FROM employee_demographics;

Select first_name, last_name, salary,
case
     when salary < 50000 then salary + (salary * 1.05)
     when salary > 50000 then salary + (salary * 1.07)
end as new_salary,
case
     when dept_id = 6 then salary + (salary * 1.10)
end as bonus
From employee_salary;

select *
from employee_salary;
select *
from parks_departments;
WITH CTE_Example AS 
(
SELECT gender, AVG(salary) avg_sal, Max(salary) max_sal, min(salary) min_sal, count(salary) count_sal
FROM parks_and_recreation.employee_demographics as dem
INNER JOIN employee_salary as sal
  ON dem.employee_id = sal.employee_id
Group by gender
)
select *
from CTE_Example
;

SELECT avg(avg_sal)
from (
select gender, AVG(salary) avg_sal, Max(salary) max_sal, min(salary) min_sal, count(salary) count_sal
FROM parks_and_recreation.employee_demographics as dem
INNER JOIN employee_salary as sal
  ON dem.employee_id = sal.employee_id
Group by gender
) example_subquery
;
