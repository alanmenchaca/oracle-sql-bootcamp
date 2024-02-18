/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : SUM Function 									*
 ************************************************************/

SELECT sum(salary), sum(ALL salary), sum(DISTINCT salary), sum(hire_date) FROM employees;

SELECT sum(salary), sum(ALL salary), sum(DISTINCT salary) FROM employees;
