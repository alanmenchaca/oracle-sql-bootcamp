-- GROUPING DATA
-- GROUP BY Clause
SELECT job_id, AVG(salary) AS "AVERAGE_SALARY" FROM employees
GROUP BY job_id
ORDER BY AVG(salary) DESC;
    
SELECT job_id, department_id, manager_id, AVG(salary), COUNT(*)
FROM employees
GROUP BY job_id, department_id, manager_id
ORDER BY COUNT(*) DESC;

-- The following statement don't work:
SELECT job_id, department_id, AVG(salary) FROM employees GROUP BY job_id;

-- The following statement is correct:
SELECT job_id, AVG(salary) FROM employees GROUP BY job_id;

/* We don't need to use all the columns used with the GROUP BY clause
   in the SELECT statement. */
SELECT AVG(salary) FROM employees GROUP BY department_id;

/* We can use as many group functions as we want in a SELECT statement
   while working with the GROUP BY clause. */
SELECT AVG(salary), SUM(salary), MIN(salary), MAX(salary), COUNT(*)
FROM employees 
GROUP BY department_id 
ORDER BY AVG(salary);

-- We can use the WHERE clause to restrict the resulting data.
SELECT job_id, department_id, AVG(salary) FROM employees
WHERE job_id IN('ST_MAN', 'SH_CLERK', 'ST_CLERK')
GROUP BY job_id, department_id
ORDER BY AVG(salary);

-- HAVING Clause
SELECT job_id, AVG(salary)
FROM employees
GROUP BY job_id
HAVING AVG(salary) > 5000;

-- The WHERE clause and the HAVING clause can also be 
-- used together in a query.
SELECT job_id, AVG(salary)
FROM employees
WHERE job_id = 'IT_PROG'
GROUP BY job_id
HAVING AVG(salary) > 5000;

SELECT job_id, AVG(salary)
FROM employees
WHERE manager_id = 101
GROUP BY job_id
HAVING AVG(salary) > 10000;

-- Nested Group Functions
SELECT MAX(AVG(salary))
FROM employees
GROUP BY department_id;

SELECT MAX(AVG(salary))
FROM employees
GROUP BY department_id;

SELECT MAX(AVG(salary)), MIN(AVG(salary))
FROM employees
GROUP BY department_id;
