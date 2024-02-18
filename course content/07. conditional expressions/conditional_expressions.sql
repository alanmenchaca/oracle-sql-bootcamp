-- CASE ... WHEN Expression
/*
CASE first_name
    WHEN 'Alex' THEN 'Name is Alex'
    WHEN 'John' THEN 'Name is John'
    ELSE 'Another'
END
*/

-- Simple Case Expression
SELECT first_name, last_name, job_id, salary, hire_date,
    CASE job_id 
        WHEN 'ST_MAN' THEN 1.20 * salary
        WHEN 'SH_MAN' THEN 1.30 * salary
        WHEN 'SA_MAN' THEN 1.40 * salary
        ELSE salary 
    END AS "UPDATED_SALARY"
FROM employees WHERE job_id IN ('ST_MAN', 'SH_MAN', 'SA_MAN');

SELECT first_name, last_name, job_id, salary,
    CASE job_id 
        WHEN 'ST_CLERK' THEN salary * 1.2
        WHEN 'SA_REP'   THEN salary * 1.3
        WHEN 'IT_PROG'  THEN salary * 1.4
        ELSE salary
    END AS "UPDATED_SALARY"
FROM employees;

-- Searched Case Expression
SELECT first_name, last_name, job_id, salary,
    CASE
        WHEN job_id = 'ST_CLERK' THEN salary * 1.2
        WHEN job_id = 'SA_REP'   THEN salary * 1.3
        WHEN job_id = 'IT_PROG'  THEN salary * 1.4
        WHEN last_name = 'King'  THEN salary * 2
        ELSE salary
    END AS "UPDATED_SALARY"
FROM employees;

-- CASE Expression in WHERE Clause
SELECT first_name, last_name, job_id, salary
FROM employees
WHERE (CASE 
        WHEN job_id = 'IT_PROG' AND salary > 5000  THEN 1
        WHEN job_id = 'SA_MAN'  AND salary > 10000 THEN 1
        ELSE 0
      END) = 1;

-- DECODE Function
SELECT first_name, last_name, job_id, salary, hire_date,
    DECODE(job_id, 'ST_MAN', salary * 1.20,
                   'SH_MAN', salary * 1.30,
                   'SA_MAN', salary * 1.40) AS "UPDATED_SALARY"
FROM employees 
WHERE job_id IN ('ST_MAN', 'SH_MAN', 'SA_MAN');
    
SELECT DECODE(25, 1, 'one',
                  2, 'two',
                  3, 'three', 
                  'Not Found') AS "RESULT" FROM dual;
                  
SELECT first_name, last_name, job_id, salary,
    DECODE(job_id, 'ST_CLERK', salary * 1.20,
                   'SA_REP',   salary * 1.30,
                   'IT_PROG',  salary * 1.40,
                   salary) AS "UPDATED_SALARY"
FROM employees;
