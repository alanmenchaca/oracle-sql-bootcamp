/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : MIN Function 									*
 ************************************************************/

SELECT * FROM employees;
SELECT min(salary), min(commission_pct), min(nvl(commission_pct,0)), 
       min(hire_date), min(first_name)
FROM employees
