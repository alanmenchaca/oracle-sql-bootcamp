/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : Multiple Column Subqueries                     *
 ***********************************************************/
 
--Nonpairwise
SELECT  employee_id, first_name, last_name, department_id, salary
FROM employees
WHERE department_id IN
                      (SELECT department_id FROM employees
                       WHERE employee_id IN (103,105,110))
AND salary IN
             (SELECT salary FROM employees
              WHERE employee_id IN (103,105,110));
 
--Pairwise
SELECT  employee_id, first_name, last_name, department_id, salary
FROM employees
WHERE (department_id,salary) IN
                                (SELECT department_id, salary 
                                 FROM employees
                                 WHERE employee_id IN (103,105,110));
 
--Nonpairwise Ex2
SELECT  employee_id, first_name, last_name, department_id, salary
FROM employees
WHERE department_id IN
                      (SELECT department_id FROM employees)
AND salary IN
             (SELECT max(salary) FROM employees
              GROUP BY department_id);
 
SELECT  employee_id, first_name, last_name, department_id, salary
FROM employees
WHERE salary IN
                (SELECT max(salary) FROM employees
                 GROUP BY department_id);
 
SELECT  employee_id, first_name, last_name, department_id, salary
FROM employees
WHERE (department_id,salary) IN
                                (SELECT department_id, max(salary) FROM employees
                                 GROUP BY department_id);
 
SELECT  employee_id, first_name, last_name, job_id, salary
FROM employees
WHERE (job_id,salary) IN
                        (SELECT job_id, max_salary FROM jobs);