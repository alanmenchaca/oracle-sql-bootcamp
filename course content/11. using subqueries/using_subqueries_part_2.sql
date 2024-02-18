-- USING SUBQUERIES - PART 2
-- Scalar Subqueries
SELECT employee_id, first_name, last_name FROM employees
WHERE department_id = (SELECT department_id 
                       FROM employees 
                       WHERE UPPER(first_name) = 'LUIS');

SELECT first_name, last_name, job_id FROM employees
WHERE salary > (SELECT AVG(salary) FROM employees);

SELECT * FROM employees 
WHERE department_id = (SELECT department_id FROM employees 
                       WHERE first_name = 'Luis');

SELECT * FROM employees 
WHERE department_id = (SELECT department_id FROM employees 
                       WHERE first_name = 'Luis');

SELECT * FROM employees 
WHERE (department_id, manager_id) IN (SELECT department_id, manager_id 
                                      FROM employees 
                                      WHERE first_name = 'Luis');


-- Correlated Subqueries
SELECT employee_id, first_name, last_name, department_id, salary
FROM employees a
WHERE salary = (SELECT MAX(salary)
                FROM employees b
            	WHERE b.department_id = a.department_id);

-- We get the same result as the previous query.
-- Oftentime, the performance of the multiple column subquery
-- may be better than the one performed with the correlated subquery.
SELECT employee_id, first_name, last_name, department_id, salary
FROM employees a
WHERE (salary, department_id) IN (SELECT MAX(salary), department_id
                                  FROM employees b
                                  GROUP BY department_id);

-- If we want to get the employees who earn below the average of
-- their departments, we can't do this with multiple column subqueries.
SELECT employee_id, first_name, last_name, department_id, salary
FROM employees a
WHERE salary < (SELECT AVG(salary)
                FROM employees b
            	WHERE b.department_id = a.department_id);                        
              
-- We can do the same as the previous statement but using INNER JOINS
SELECT a.employee_id, a.first_name, a.last_name, a.department_id, a.salary
FROM employees a INNER JOIN (SELECT AVG(salary) AS "AVG_SAL", department_id
                             FROM employees
                             GROUP BY department_id) b
ON (a.department_id = b.department_id)
WHERE a.salary < b.avg_sal;

SELECT e.employee_id, e.first_name, e.last_name, e.department_id, e.salary,
       (SELECT ROUND(AVG(salary)) -- Correlated Scalar Subquery
        FROM employees
        WHERE department_id = d.department_id) AS "DEPARTMENT'S AVERAGE SALARY"
FROM employees e INNER JOIN departments d 
ON (e.department_id = d.department_id);


-- EXISTS Operator + Oracle Semijoins
SELECT employee_id, first_name, last_name, department_id
FROM employees a
WHERE EXISTS (SELECT null FROM employees
              WHERE manager_id = a.employee_id);


-- NOT EXISTS Operator
SELECT * FROM departments d
WHERE NOT EXISTS (SELECT null
                  FROM employees e 
                  WHERE e.department_id = d.department_id);

-- When using the NOT IN operator, no rows are returned: If any
-- row with a null value returns by the subquery, there will be
-- logical error.
SELECT * FROM departments d
WHERE department_id NOT IN (SELECT department_id FROM employees);
