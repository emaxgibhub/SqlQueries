/*first option*/

SELECT
     re.employee_id,
     re.last_name,
     re.department_id,
     re.salary,
     re.row_rank
 FROM
     (
         SELECT
             e.employee_id,
             e.last_name,
             e.department_id,
             e.salary,
             DENSE_RANK() OVER(
                 PARTITION BY department_id
                 ORDER BY
                     salary DESC
             ) AS row_rank
         FROM
             employees e
     ) re
 WHERE
     re.row_rank = 1