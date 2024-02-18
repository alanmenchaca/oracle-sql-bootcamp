/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : Join with the USING Clause						*
 ************************************************************/

SELECT * FROM employees NATURAL JOIN departments;

SELECT * FROM employees JOIN departments
USING(department_id);

SELECT * FROM employees JOIN departments
USING(department_id, manager_id);