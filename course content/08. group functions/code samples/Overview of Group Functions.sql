/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : Overview of Group Functions   					*
 ************************************************************/

SELECT SUM(salary), AVG(salary), MAX(hire_date), MIN(commission_pct), 
COUNT(DISTINCT manager_id), LISTAGG(job_id,',') 
FROM employees;

SELECT SUM(salary), AVG(salary), MAX(hire_date), MIN(commission_pct), 
COUNT(DISTINCT manager_id), LISTAGG(job_id,','), hire_date
FROM employees
