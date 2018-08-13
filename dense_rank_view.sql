CREATE view empl_dep_salary_rank as
select 
e.employee_id,
e.last_name,
e.DEPARTMENT_ID,
e.salary,
dense_rank() over (partition by e.DEPARTMENT_ID order BY salary DESC ) row_rank

from hr.employees e
order by e.department_id;

select * from empl_dep_salary_rank
where row_rank =1;