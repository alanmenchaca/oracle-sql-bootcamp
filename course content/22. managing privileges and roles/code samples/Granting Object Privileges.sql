/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : Granting Object Privileges                     *
 ************************************************************/

--These are the code that must be pasted in the worksheet connected as temp_user:
SELECT * FROM employees_copy;
SELECT * FROM hr.employees_copy;
UPDATE hr.employees_copy SET salary = 100;
UPDATE hr.employees_copy SET manager_id = 100;
INSERT INTO hr.employees_copy (employee_id,first_name,last_name,email,hire_date,job_id,salary) 
VALUES (207,'Alex','Brown','ABROWN',sysdate,'IT_PROG',5000);
CREATE INDEX idx_emp_cpy ON hr.employees_copy(email);
SELECT * FROM user_tab_privs;

--These are the code that must be pasted in the worksheet connected as the HR user:
SELECT * FROM employees_copy;
GRANT SELECT, DELETE ON employees_copy TO temp_user, developer;
GRANT UPDATE (salary,commission_pct) ON employees_copy TO temp_user;
GRANT UPDATE ON employees_copy TO developer;
GRANT INSERT ON employees_copy TO public; 
GRANT ALL ON employees_copy TO temp_user;
GRANT UNLIMITED TABLESPACE TO temp_user;
