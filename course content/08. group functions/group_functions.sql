-- GROUP FUNCTIONS
-- AVG Function 
SELECT AVG(salary), AVG(ALL salary), AVG(DISTINCT salary)
FROM employees 
WHERE job_id = 'IT_PROG';

SELECT AVG(commission_pct), AVG(NVL(commission_pct, 0)) FROM employees;

-- COUNT Function
SELECT COUNT(*), COUNT(manager_id), COUNT(ALL manager_id),
    COUNT(DISTINCT manager_id) FROM employees;
    
SELECT COUNT(*), 
       COUNT(commission_pct),
       COUNT(DISTINCT commission_pct),
       COUNT(DISTINCT NVL(commission_pct, 0))
FROM employees;

-- MAX Function
-- The largest value for numeric values.
-- The latest date for dates values.
-- The last value on alphabetical order for text values.
SELECT MAX(salary), MAX(hire_date), MAX(first_name) FROM employees;
SELECT * FROM employees ORDER BY first_name DESC;

-- MIN Function
SELECT MIN(salary), MIN(commission_pct), MIN(NVL(commission_pct, 0)),
       MIN(hire_date), MIN(first_name) 
FROM employees;

SELECT MIN(commission_pct),
       MIN(NVL(commission_pct, 0)), 
       MIN(hire_date),
       MIN(first_name)
FROM employees;

-- SUM Function
SELECT SUM(salary), SUM(ALL salary), SUM(DISTINCT salary) FROM employees;

-- LISTAGG Function
SELECT LISTAGG(first_name, ', ') 
       WITHIN GROUP (ORDER BY first_name DESC) AS "Employees"
FROM employees
WHERE job_id = 'ST_CLERK';

SELECT LISTAGG(DISTINCT salary, ', ') 
       WITHIN GROUP (ORDER BY salary DESC) AS "Employees"
FROM employees
WHERE job_id = 'ST_CLERK';

SELECT LISTAGG(city, ', ') AS CITIES 
FROM locations
WHERE country_id = 'US';
 
 -- Real World Example
 SELECT j.job_title,
    LISTAGG(e.first_name, ', ') 
        WITHIN GROUP (ORDER BY e.first_name) AS employees_list
FROM employees e, jobs j
WHERE e.job_id = j.job_id
    GROUP BY j.job_title;

SELECT MIN(salary), MAX(hire_date), AVG(salary), COUNT(*),
    LISTAGG(DISTINCT job_id, ', ') WITHIN GROUP (ORDER BY job_id DESC)
FROM employees;
