-- Comparison Operators
SELECT * FROM employees WHERE salary > 10000;
SELECT * FROM employees WHERE salary < 10000;
SELECT * FROM employees WHERE hire_date > '01-JUN-05';
SELECT * FROM employees WHERE hire_date = '21-MAY-07';
SELECT * FROM employees WHERE manager_id = 100;

-- Using WHERE Clause
SELECT * FROM employees;
SELECT * FROM employees WHERE salary > 10000;
SELECT * FROM employees WHERE job_id = 'IT_PROG';

-- BETWEEN ... AND Operator
SELECT * FROM employees WHERE salary BETWEEN 10000 AND 14000;
SELECT * FROM employees WHERE hire_date BETWEEN '07-JUN-02' AND '29-JAN-08';
SELECT * FROM employees WHERE hire_date BETWEEN '07-JUN-02' AND '29-JAN-05';

-- IN Operator
SELECT * FROM employees WHERE employee_id IN (50, 100, 65, 210);
SELECT * FROM employees WHERE first_name IN ('Steven', 'Peter', 'Adam');
SELECT * FROM employees WHERE hire_date IN ('17-JUN-03', '13-JAN-01', '05-FEB-06');
    
-- INCORRECT WAY TO GET NULL OR NOT NULL VALUES
SELECT * FROM employees WHERE commission_pct = NULL;
SELECT * FROM employees WHERE commission_pct != NULL;

-- CORRECT WAY TO GET NULL OR NOT NULL VALUES
SELECT * FROM employees WHERE commission_pct IS NULL;
SELECT * FROM employees WHERE commission_pct IS NOT NULL;

-- LIKE Operator
SELECT * FROM employees WHERE job_id LIKE 'SA%';
SELECT * FROM employees WHERE first_name LIKE '%a';
SELECT * FROM employees WHERE first_name LIKE '_r%';

-- Logical Operators (AND, OR, NOT)
SELECT * FROM employees 
    WHERE (job_id = 'SA_REP' AND salary > 10000 AND first_name = 'Lisa');
    
SELECT * FROM employees WHERE (job_id = 'SA_REP' OR salary > 10000);
SELECT * FROM employees WHERE (job_id = 'SA_REP' OR salary > 10000); 

SELECT * FROM employees 
    WHERE salary > 10000 AND job_id NOT IN ('SA_MAN', 'SA_REP');

-- MANAGERS THAT EARN LESS THAN $10,000
SELECT employee_id, first_name, last_name, salary, job_id
    FROM employees 
        WHERE (job_id LIKE '%MAN%') AND (salary < 10000);
        
-- Rules of precedence
SELECT first_name, last_name, job_id, salary FROM employees
    WHERE job_id = 'IT_PROG' OR job_id = 'ST_CLERK' AND salary > 5000;

-- It's more clear the query with parentheses 
SELECT first_name, last_name, job_id, salary FROM employees
    WHERE (job_id = 'IT_PROG' OR job_id = 'ST_CLERK') AND salary > 5000;

SELECT first_name, last_name, department_id, salary FROM employees
    WHERE (department_id = 20 OR department_id = 30) AND salary > 10000 ;

SELECT employee_id, department_id, job_id, salary FROM employees 
    WHERE (department_id = 50) OR 
    ((job_id = 'SA_REP') AND (salary BETWEEN 5000 AND 10000));
    