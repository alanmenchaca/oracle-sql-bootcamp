SELECT TO_CHAR(salary, '$99,999.99'), salary FROM employees;

-- TO_CHAR Function
SELECT salary, (salary * commission_pct * 100) AS "Original",
        TO_CHAR(salary * commission_pct * 100, 'L999,999.00') AS "Formatted Version"
    FROM employees WHERE commission_pct IS NOT NULL;
 
 -- TO_NUMERIC Function
 SELECT TO_NUMBER('$5,322.33', '$99,999.00') AS "Formatted Number" FROM dual;

-- TO_DATE Function
SELECT first_name, last_name, 
    TO_CHAR(hire_date, 'DDSPTH Month YYYY') AS "Hire Date" FROM employees 
    WHERE hire_date > TO_DATE('Jun 12, 2005', 'Mon DD, YYYY');

SELECT first_name, last_name, 
    TO_CHAR(hire_date, 'DDSP Month YYYY') AS "Hire Date" FROM employees 
    WHERE hire_date > TO_DATE('Jun 12, 2005', 'Mon DD, YYYY');

--- Null-Related Functions ---
--- NVL Function
SELECT job_id, first_name, last_name, commission_pct,
    NVL(commission_pct, 0) AS NVL_COMM_PCT FROM employees
    WHERE job_id IN('SA_REP', 'IT_PROG');
    
SELECT employee_id, salary, commission_pct, 
       salary + salary * NVL(commission_pct, 0) AS "NVL_NEW_SAL"
    FROM employees;

-- NVL2 Function - NVL2(column, 'has a value', 'has not a value (null)')
SELECT job_id, first_name, last_name, commission_pct,
    NVL2(commission_pct, 'has', 'has not') AS "NVL2 EXAMPLE"
    FROM employees WHERE job_id IN('SA_REP', 'IT_PROG')
    ORDER BY commission_pct NULLS LAST;

-- NULLIF Function
SELECT first_name, last_name, 
    LENGTH(first_name) AS "LEN1", LENGTH(last_name) AS "LEN2",
    NULLIF(LENGTH(first_name), LENGTH(last_name)) AS "RESULT"
    FROM employees
    WHERE NULLIF(LENGTH(first_name), LENGTH(last_name)) IS NULL;
    
-- COALESCE Function
SELECT COALESCE(NULL, NULL, 1, 2, 3, NULL) FROM dual;
SELECT COALESCE(NULL, NULL, NULL) FROM dual;
SELECT state_province, COALESCE(state_province, city) FROM locations;
