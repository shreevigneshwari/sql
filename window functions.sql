select *
from employee_demographics dem
Join employee_salary sal
  on dem.employee_id = sal.employee_id
group by gender;

select dem.first_name,dem.last_name, sum(salary) over(partition by gender)
from employee_demographics dem
Join employee_salary sal
  ON dem.employee_id = sal.employee_id
group by dem.first_name, dem.last_name,gender;
  
select dem.first_name,dem.last_name, gender, salary,
sum(salary) over(partition by gender order by dem.employee_id) as rolling_total
from employee_demographics dem
Join employee_salary sal
  ON dem.employee_id = sal.employee_id;
  
select dem.first_name,dem.last_name, gender, salary,
row_number() over(partition by gender order by salary desc) as row_num,
rank() over(partition by gender order by salary desc) rank_num,
dense_rank() over(partition by gender order by salary desc) dense_rank_num
from employee_demographics dem
Join employee_salary sal
  ON dem.employee_id = sal.employee_id;

  


