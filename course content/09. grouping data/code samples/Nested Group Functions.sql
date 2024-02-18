/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : Nested Group Functions							*
 ************************************************************/

SELECT department_id, max(avg(salary)) FROM employees
GROUP BY department_id; 

SELECT max(avg(salary)) FROM employees
GROUP BY department_id; 

SELECT max(avg(salary)), min(avg(salary)) FROM employees
GROUP BY department_id;