/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : Matching Unmatched Queries in SET Operations   *
 ************************************************************/

SELECT job_id, department_id, first_name, last_name FROM employees
UNION ALL
SELECT job_id, department_id, NULL, NULL FROM job_history;

SELECT job_id, NULL department_id, first_name, last_name FROM employees
UNION ALL
SELECT job_id, department_id, NULL, NULL FROM job_history;

SELECT job_id, 0 department_id, first_name, last_name FROM employees
UNION ALL
SELECT job_id, department_id, NULL, NULL FROM job_history;