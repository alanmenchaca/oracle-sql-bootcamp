/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : Conditional INSERT FIRST Statements            *
 ************************************************************/

--Creates a table called low_salaries with no data based on the employees table columns
CREATE TABLE low_salaries AS 
    SELECT employee_id, department_id, salary FROM employees WHERE 1=2;

--Creates a table called average_salaries with no data based on the employees table columns
CREATE TABLE average_salaries AS 
    SELECT employee_id, department_id, salary FROM employees WHERE 1=2;
    
--Creates a table called high_salaries with no data based on the employees table columns
CREATE TABLE high_salaries AS 
    SELECT employee_id, department_id, salary FROM employees WHERE 1=2;

SELECT * FROM low_salaries;
SELECT * FROM average_salaries;
SELECT * FROM high_salaries;

INSERT FIRST
   WHEN salary<5000 THEN
      INTO low_salaries VALUES(employee_id, department_id, salary)
   WHEN salary BETWEEN 5000 AND 10000 THEN
      INTO average_salaries VALUES(employee_id, department_id, salary)
   ELSE 
      INTO high_salaries VALUES(employee_id, department_id, salary)
SELECT * FROM employees;
