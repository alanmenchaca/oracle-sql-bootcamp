/************* The Complete Oracle SQL Bootcamp ****************
 * Author  : Oracle Master Training                            *
 * Course  : The Complete Oracle SQL Bootcamp                  *
 * Lecture : Case Conversion (LOWER, UPPER, INITCAP) Functios  *
 ***************************************************************/

SELECT first_name, UPPER(first_name), 
       last_name, LOWER(last_name), 
       email, INITCAP(email) FROM employees;
       
SELECT first_name, UPPER(first_name), 
       last_name, LOWER(last_name), 
       email, INITCAP(email) FROM employees
WHERE job_id = 'IT_PROG';

SELECT first_name, UPPER(first_name), 
       last_name, LOWER(last_name), 
       email, INITCAP(email),
       UPPER('bmw i8')FROM employees
WHERE job_id = 'IT_PROG';

SELECT * FROM employees
WHERE last_name = 'KING';

SELECT * FROM employees
WHERE last_name = 'king';

SELECT * FROM employees
WHERE LOWER(last_name) = 'king';

SELECT * FROM employees
WHERE UPPER(last_name) = 'KING';

SELECT * FROM employees
WHERE INITCAP(last_name) = 'King';