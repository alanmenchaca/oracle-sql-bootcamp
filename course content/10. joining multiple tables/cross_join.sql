-- Cross Join (Cartesian Product/Cross Product)
SELECT e.first_name, e.last_name, e.department_id, d.department_name
FROM employees e CROSS JOIN departments d;

SELECT e.first_name, e.last_name, e.department_id, d.department_name
FROM employees e 
    CROSS JOIN departments d
    CROSS JOIN jobs
WHERE job_title = 'Finance Manager';

SELECT d.department_name, j.job_title, COUNT(*) AS "EMPLOYEE_COUNT"
FROM employees e 
     INNER JOIN departments d ON e.department_id = d.department_id
     INNER JOIN jobs j ON e.job_id = j.job_id
GROUP BY d.department_name, j.job_title
ORDER BY d.department_name, j.job_title;

SELECT c.department_name, c.job_title, COUNT(e.employee_id) AS "EMPLOYEE_COUNT"
FROM (SELECT d.department_name, j.job_title, j.job_id, d.department_id
      FROM departments d CROSS JOIN jobs j) c
LEFT OUTER JOIN employees e
    ON (e.job_id = c.job_id AND e.department_id = c.department_id)
GROUP BY c.department_name, c.job_title
ORDER BY c.department_name, c.job_title;
      