/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : MERGE Statement                                *
 ************************************************************/

SELECT * FROM employees_copy;
DELETE FROM employees_copy;
INSERT INTO employees_copy SELECT * FROM employees WHERE job_id = 'SA_REP';
UPDATE employees_copy SET first_name = 'Alex';

MERGE INTO employees_copy c
USING (SELECT * FROM employees) e
ON (c.employee_id = e.employee_id)
WHEN MATCHED THEN
   UPDATE SET
      c.first_name = e.first_name,
      c.last_name = e.last_name,
      c.department_id = e.department_id,
      c.salary = e.salary
   DELETE WHERE department_id IS NULL
WHEN NOT MATCHED THEN
   INSERT 
   VALUES(e.employee_id, e.first_name, e.last_name, e.email, 
   e.phone_number, e.hire_date, e.job_id, e.salary, e.commission_pct, 
   e.manager_id, e.department_id);

MERGE INTO employees_copy c
USING (SELECT * FROM employees WHERE job_id = 'IT_PROG') e
ON (c.employee_id = e.employee_id)
WHEN MATCHED THEN
   UPDATE SET
      c.first_name = e.first_name,
      c.last_name = e.last_name,
      c.department_id = e.department_id,
      c.salary = e.salary
   DELETE WHERE department_id IS NULL
WHEN NOT MATCHED THEN
   INSERT 
   VALUES(e.employee_id, e.first_name, e.last_name, e.email, 
   e.phone_number, e.hire_date, e.job_id, e.salary, e.commission_pct, 
   e.manager_id, e.department_id);

MERGE INTO employees_copy c
USING employees e
ON (c.employee_id = e.employee_id)
WHEN MATCHED THEN
   UPDATE SET
      c.first_name = e.first_name,
      c.last_name = e.last_name,
      c.department_id = e.department_id,
      c.salary = e.salary
   DELETE WHERE department_id IS NULL
WHEN NOT MATCHED THEN
   INSERT 
   VALUES(e.employee_id, e.first_name, e.last_name, e.email, 
   e.phone_number, e.hire_date, e.job_id, e.salary, e.commission_pct, 
   e.manager_id, e.department_id);