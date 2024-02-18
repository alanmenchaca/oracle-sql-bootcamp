/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : Date Functions & Arithmetic Operations on Dates*
 ************************************************************/

SELECT sysdate FROM dual;
SELECT sysdate, current_date, sessiontimezone, systimestamp, current_timestamp 
FROM dual;
SELECT sysdate FROM dual;
SELECT sysdate, sysdate + 4 FROM dual;
SELECT sysdate, sysdate - 4 FROM dual;
SELECT sysdate, sysdate + 1/24 FROM dual;
SELECT sysdate, sysdate + 1/(24*60) FROM dual;
SELECT employee_id, hire_date,sysdate FROM employees;
SELECT employee_id, hire_date,sysdate, sysdate-hire_date worked_in_days
FROM employees;
SELECT employee_id, hire_date,sysdate,trunc(sysdate-hire_date) worked_in_days 
FROM employees;
SELECT employee_id, hire_date,sysdate,trunc((sysdate-hire_date)/365) worked_in_years 
FROM employees
ORDER BY worked_in_years DESC;