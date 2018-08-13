SELECT FIRST_NAME, LAST_NAME, HIRE_DATE
FROM
(
SELECT
     e.employee_id,
     e.first_name,
     e.last_name,
     level lvl,
     MAX(level) OVER() max_level,
     e.hire_date,
     DENSE_RANK() OVER( partition by level
         ORDER BY
             e.hire_date
     ) hire_date_rank
 FROM
     employees e
 START WITH
     e.manager_id IS NULL
 CONNECT BY
     PRIOR e.employee_id = e.manager_id) ot
     where ot.lvl=ot.max_level and  hire_date_rank =1 
    --where ot.level = 4
     
     