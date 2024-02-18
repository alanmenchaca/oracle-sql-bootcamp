/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : -                                              *
 ***********************************************************/
 
--Create Code for the Retired_Employees Table
CREATE TABLE retired_employees AS 
SELECT * FROM employees WHERE job_id = 'IT_PROG' AND ROWNUM <5; --Creates the table, and adds 4 IT Programmers into the retired_employees table.

--Adds a new record.
INSERT INTO retired_employees(employee_id, first_name, last_name, salary, email, phone_number, hire_date, job_id,commission_pct, manager_id, department_id)
VALUES (1,'Larry', 'McCain', 30000, 'LMCCAIN', '951.742.6792', '24-MAR-96','AD_PRES', '0.5', NULL, 90);
--Adds another record.
INSERT INTO retired_employees(employee_id, first_name, last_name, salary, email, phone_number, hire_date, job_id,commission_pct, manager_id, department_id)
VALUES (2, 'Mary', 'Walker', 9000, 'MWALKER', '314.680.1441', '13-SEP-99', 'SA_REP', '0.2', 1, 80);
COMMIT;