/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : FOR UPDATE Statement                           *
 ************************************************************/

--CODE TO EXECUTE WITH HR
SELECT * FROM employees_copy
WHERE job_id = 'IT_PROG' FOR UPDATE;

SELECT first_name, last_name, salary
FROM employees_copy e JOIN departments d
USING(department_id) 
WHERE location_id = 1400 
FOR UPDATE;

SELECT first_name, last_name, salary
  FROM employees_copy e JOIN departments d
  USING(department_id) 
  WHERE location_id = 1400
  FOR UPDATE OF first_name, last_name;

SELECT first_name, last_name, salary
  FROM employees_copy e JOIN departments d
  USING(department_id) 
  WHERE location_id = 1400
  FOR UPDATE OF first_name, location_id NOWAIT;

SELECT first_name, last_name, salary
  FROM employees_copy e JOIN departments d
  USING(department_id) 
  WHERE location_id = 1400
  FOR UPDATE OF first_name, location_id WAIT 5;

SELECT first_name, last_name, salary
  FROM employees_copy e JOIN departments d
  USING(department_id) 
  WHERE location_id = 1400
  FOR UPDATE OF first_name SKIP LOCKED;



--CODE TO EXECUTE WITH SYSTEM
SELECT * FROM hr.employees_copy
WHERE job_id = 'IT_PROG';

UPDATE hr.employees_copy SET salary = 1
WHERE employee_id = 104;
UPDATE hr.employees_copy SET salary = 1
WHERE employee_id = 100;

UPDATE hr.departments SET manager_id = 100
WHERE department_id = 60;