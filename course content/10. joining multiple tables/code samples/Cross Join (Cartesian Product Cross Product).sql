/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : Cross Join (Cartesian Product / Cross Product)	*
 ************************************************************/
 
SELECT first_name, last_name, department_name
FROM employees CROSS JOIN departments;

SELECT first_name, last_name, department_name, job_title
FROM employees CROSS JOIN departments
CROSS JOIN jobs;

SELECT * FROM employees, departments;

SELECT first_name, last_name, department_name, job_title
FROM employees CROSS JOIN departments
CROSS JOIN jobs
WHERE job_title = 'Finance Manager';


SELECT d.department_name, j.job_title, COUNT(*) AS employee_count
FROM employees e JOIN departments d ON (e.department_id = d.department_id)
JOIN jobs j ON(j.job_id = e.job_id)
GROUP BY d.department_name, j.job_title
ORDER BY d.department_name, j.job_title;

SELECT c.department_name, c.job_title, COUNT(*) AS employee_count
FROM 
    (SELECT d.department_name, j.job_title, j.job_id, d.department_id
            FROM departments d CROSS JOIN jobs j) c
LEFT OUTER JOIN employees e
ON (e.job_id = c.job_id AND e.department_id = c.department_id)
GROUP BY c.department_name, c.job_title
ORDER BY c.department_name, c.job_title;

SELECT c.department_name, c.job_title, e.department_id-- COUNT(*) AS employee_count
FROM 
    (SELECT d.department_name, j.job_title, j.job_id, d.department_id
            FROM departments d CROSS JOIN jobs j) c
LEFT OUTER JOIN employees e
ON (e.job_id = c.job_id AND e.department_id = c.department_id)
--GROUP BY c.department_name, c.job_title
ORDER BY c.department_name, c.job_title;

SELECT c.department_name, c.job_title, COUNT(e.employee_id) AS employee_count
FROM 
    (SELECT d.department_name, j.job_title, j.job_id, d.department_id
            FROM departments d CROSS JOIN jobs j) c
LEFT OUTER JOIN employees e
ON (e.job_id = c.job_id AND e.department_id = c.department_id)
GROUP BY c.department_name, c.job_title
ORDER BY c.department_name, c.job_title;