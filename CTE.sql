WITH CTE_example as
(
select gender, avg(salary), max(salary) max_sal, min(salary) min_sal, count(salary) count_sal
from employee_demographics dem
Join employee_salary sal
  ON dem.employee_id = sal.employee_id
group by gender
)
select avg(avg
from cte_example
;