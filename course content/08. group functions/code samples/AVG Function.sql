/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : AVG Function 									*
 ************************************************************/

SELECT avg(salary), avg(all salary), avg(distinct salary) FROM employees;

SELECT avg(salary), avg(all salary), avg(distinct salary)
FROM employees WHERE job_id = 'IT_PROG';

SELECT avg(salary), avg(all salary), avg(distinct salary), salary 
FROM employees WHERE job_id = 'IT_PROG';

SELECT avg(commission_pct) FROM employees;

SELECT avg(commission_pct), avg(nvl(commission_pct,0)) FROM employees;