/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : Conditional INSERT ALL Statements              *
 ************************************************************/

--Creates a table called it_programmers with no data based on the employees table columns
CREATE TABLE it_programmers AS 
    SELECT employee_id, first_name, last_name, hire_date FROM employees WHERE 1=2;

--Creates a table called working_in_us with no data based on the employees table columns
CREATE TABLE working_in_the_us AS 
    SELECT employee_id, first_name, last_name, job_id, department_id FROM employees WHERE 1=2;

INSERT ALL
 WHEN hire_date > to_date('15-MAR-08') THEN
  INTO employees_history VALUES (employee_id,first_name,last_name,hire_date)
  INTO salary_history VALUES (employee_id, EXTRACT(year FROM sysdate),    
  EXTRACT(month FROM sysdate),salary, commission_pct)
 WHEN job_id = 'IT_PROG' THEN
  INTO it_programmers VALUES(employee_id,first_name,last_name,hire_date)
 WHEN department_id IN 
    (SELECT department_id FROM departments WHERE location_id IN
        (SELECT location_id FROM locations WHERE country_id = 'US')) THEN
  INTO working_in_the_us VALUES (employee_id,first_name,last_name,job_id,department_id)
SELECT * FROM employees;

SELECT * FROM it_programmers;
SELECT * FROM working_in_the_us;
SELECT * FROM employees_history;

INSERT ALL
 WHEN hire_date > to_date('15-MAR-08') THEN
  INTO salary_history VALUES (employee_id, EXTRACT(year FROM sysdate),    
  EXTRACT(month FROM sysdate),salary, commission_pct)
 WHEN job_id = 'IT_PROG' THEN
  INTO it_programmers VALUES(employee_id,first_name,last_name,hire_date)
 WHEN department_id IN 
    (SELECT department_id FROM departments WHERE location_id IN
        (SELECT location_id FROM locations WHERE country_id = 'US')) THEN
  INTO working_in_the_us VALUES (employee_id,first_name,last_name,job_id,department_id)
 ELSE
  INTO employees_history VALUES (employee_id,first_name,last_name,hire_date)
SELECT * FROM employees;

INSERT ALL
 WHEN hire_date > to_date('15-MAR-08') THEN
  INTO salary_history VALUES (employee_id, EXTRACT(year FROM sysdate),    
  EXTRACT(month FROM sysdate),salary, commission_pct)
 WHEN 1=1 THEN
  INTO it_programmers VALUES(employee_id,first_name,last_name,hire_date)
 WHEN department_id IN 
    (SELECT department_id FROM departments WHERE location_id IN
        (SELECT location_id FROM locations WHERE country_id = 'US')) THEN
  INTO working _in_the_us VALUES (employee_id,first_name,last_name,job_id,department_id)
 ELSE
  INTO employees_history VALUES (employee_id,first_name,last_name,hire_date)
SELECT * FROM employees;