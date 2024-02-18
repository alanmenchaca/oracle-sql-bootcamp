/************* The Complete Oracle SQL Bootcamp **********************
 * Author  : Oracle Master Training                                  *
 * Course  : The Complete Oracle SQL Bootcamp                        *
 * Lecture : Unconditional Insert Statements (INSERT ALL Statements) *
 *********************************************************************/

--Creates the employees_history table with no data based on the employees table
CREATE TABLE employees_history AS 
    SELECT employee_id, first_name, last_name, hire_date 
    FROM employees WHERE 1=2;
    
--Creates the salary_history table with no data based on the employees table
--1234 and 12 are just ordinary numbers, to make the data type of these columns number
CREATE TABLE salary_history AS
    SELECT employee_id, 1234 AS year, 12 AS month, salary, commission_pct
    FROM employees WHERE 1=2;

--Inserts all the returning rows into two different tables in one step
INSERT ALL
  INTO employees_history VALUES (employee_id,first_name,last_name,hire_date)
  INTO salary_history VALUES (employee_id, EXTRACT(year FROM sysdate),    
  EXTRACT(month FROM sysdate),salary, commission_pct)
SELECT * FROM employees WHERE hire_date> TO_DATE('15-MAR-08');

SELECT * FROM employees_history;

SELECT * FROM salary_history;

--Insert multiple rows into the same table, with static values
INSERT ALL
  INTO employees_history VALUES (105,'Adam','Smith',sysdate)
  INTO employees_history VALUES (106,'Paul','Smith',sysdate+1)
SELECT * FROM dual;