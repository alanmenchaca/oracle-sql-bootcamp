-- Conversion Functions
-- Implicit Conversion FROM a VARCHAR2 value TO a "NUMBER" value.
SELECT * FROM employees WHERE salary > '5000';

-- Implicit Conversion FROM a VARCHAR2 value TO a "DATE" value.
SELECT * FROM employees WHERE hire_date = '17-JUN-03';

-- Implicit Conversion FROM a NUMBER value TO a VARCHAR2 value.
SELECT DEPARTMENT_ID || DEPARTMENT_NAME FROM departments;

-- Implicit Conversion FROM a DATE value TO a VARCHAR2 value.
SELECT first_name || sysdate FROM employees;
