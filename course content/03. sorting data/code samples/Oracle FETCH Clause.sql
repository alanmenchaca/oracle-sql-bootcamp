/************* The Complete Oracle SQL Bootcamp ****************
 * Author  : Oracle Master Training                            *
 * Course  : The Complete Oracle SQL Bootcamp                  *
 * Lecture : Oracle FETCH Clause                               *
 ***************************************************************/

SELECT first_name, last_name, salary FROM employees 
ORDER BY salary DESC
OFFSET 1 ROW FETCH FIRST 10 ROWS ONLY;

SELECT first_name, last_name, salary FROM employees 
ORDER BY salary DESC
OFFSET 1 ROW FETCH FIRST 10 ROWS WITH TIES;

SELECT first_name, last_name, salary FROM employees 
OFFSET 1 ROW FETCH FIRST 10 ROWS WITH TIES;

SELECT first_name, last_name, salary FROM employees
ORDER BY salary DESC
FETCH FIRST 10 ROWS WITH TIES;

SELECT first_name, last_name, salary FROM employees
ORDER BY salary DESC
OFFSET 5 ROW;

SELECT first_name, last_name, salary FROM employees 
ORDER BY salary DESC
OFFSET 1 ROWS FETCH FIRST 10 ROWS WITH TIES;

SELECT first_name, last_name, salary FROM employees 
ORDER BY salary DESC
OFFSET 1 ROWS FETCH FIRST 10 ROWS WITH TIES;
