SELECT
     DECODE(d.department_name,NULL,'-',d.department_name) "Dapartment Name",
     TO_CHAR(avg_sal_sq.avg_sal,'999999.99') "Deparment Average Salary",
     DENSE_RANK() OVER(
         ORDER BY
             avg_sal_sq.avg_sal DESC
     ) "Average Salary Department Rank"
 FROM
     (
         SELECT
             AVG(salary) avg_sal,
             e.department_id
         FROM
             employees e
         GROUP BY
             e.department_id
     ) avg_sal_sq
     LEFT JOIN departments d USING ( department_id )