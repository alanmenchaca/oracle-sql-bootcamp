/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : Date Manipulation Functions in SQL             *
 ************************************************************/

SELECT sysdate, add_months(sysdate,2) FROM dual;
SELECT sysdate, add_months(sysdate,-2) FROM dual;
SELECT sysdate, add_months(sysdate,30) FROM dual;
SELECT sysdate, add_months('12-JUL-21',30) FROM dual;
SELECT employee_id, hire_date, 
    trunc(hire_date,'MONTH') truncated_result, round(hire_date,'MONTH') rounded_result
FROM employees;
SELECT employee_id, hire_date, 
    trunc(hire_date,'YEAR') truncated_result, round(hire_date,'YEAR') rounded_result
FROM employees;	
SELECT extract(year from sysdate) extracted_result FROM dual;
SELECT extract(month from sysdate) extracted_result FROM dual;
SELECT extract(day from sysdate) extracted_result FROM dual;
SELECT next_day(sysdate,'SUNDAY') next_day_result FROM dual;
SELECT last_day(sysdate) last_day_result FROM dual;
SELECT last_day('04-JUL-20') last_day_result FROM dual;