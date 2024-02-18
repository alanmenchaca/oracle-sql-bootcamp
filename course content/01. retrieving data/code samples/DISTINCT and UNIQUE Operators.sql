/************* The Complete Oracle SQL Bootcamp ****************
 * Author  : Oracle Master Training                            *
 * Course  : The Complete Oracle SQL Bootcamp                  *
 * Lecture : DISTINCT and UNIQUE Operators                     *
 ***************************************************************/

SELECT first_name FROM employees;
SELECT distinct first_name FROM employees;
SELECT unique first_name FROM employees;
SELECT distinct job_id, distinct department_id FROM employees;
SELECT distinct job_id, department_id FROM employees;
SELECT distinct job_id FROM employees;
SELECT distinct job_id, department_id, first_name FROM employees;
SELECT job_id, distinct department_id, first_name FROM employees;
