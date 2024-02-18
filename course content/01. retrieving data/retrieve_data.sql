-- Using SELECT Statements
--Retrieving all the columns(fields) from a table. 
SELECT * FROM employees;
--Retrieving specific column(s) from a table.
SELECT first_name, last_name, email FROM EMPLOYEES;

-- INFORMATION and DESCRIBE Command
DESCRIBE employees;
DESC employees;
INFORMATION employees;
INFO departments;
INFO+ employees;

-- Using Column Aliases
SELECT first_name AS name, last_name AS surname, email FROM employees; 
SELECT first_name AS "My     Name", email "E-mail" FROM employees; 
SELECT first_name AS "My Name", email "E-mail" FROM employees; 
SELECT employee_id, salary + nvl(salary * commission_pct , 0) + 1000, salary FROM employees;

-- Quote (Q) Operator
select 'My Name is Adam' as "Output" from dual;
select 'I''m using quote operator in SQL statements' as "Output" from dual;
select q'[I'm using quote operator in SQL statements]' as "Quote Operator" from dual;
select q'<I'm using quote operator in SQL statements>' as "Quote Operator" from dual;
select q'dI'm using quote operator in SQL statementsd' as "Quote Operator" from dual;

-- Arithmetic Operators and NULL Values
SELECT * FROM employees;
SELECT employee_id, salary, (salary + 100) * 12 AS annual_salary FROM employees;
SELECT sysdate FROM dual;
SELECT sysdate + 4 FROM dual; -- Add 4 days to sysdate.
SELECT salary, (salary * commission_pct), commission_pct FROM employees;

-- Concatenation Operators
SELECT 'My Name is Alex' FROM employees;
SELECT 'My Name is ' || first_name FROM employees;
SELECT 'The commission percentage is ' || commission_pct AS concatenation, commission_pct FROM employees;
SELECT first_name || ' ' || last_name AS "full_name" FROM employees;
SELECT street_address || ',' || city || ',' || postal_code || ',' || state_province || ',' || country_id AS "full address" 
FROM locations;

--DISTINCT and UNIQUE Operators
SELECT DISTINCT first_name FROM employees;
SELECT UNIQUE first_name FROM employees;
--SELECT DISTINCT job_id, DISTINCT department_id FROM employees;
SELECT DISTINCT job_id FROM employees;
SELECT DISTINCT job_id, department_id FROM employees;
--SELECT job_id, DISTINCT department_id, first_name FROM employees;
