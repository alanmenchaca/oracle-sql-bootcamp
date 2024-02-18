/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : Modifying Views                                *
 ************************************************************/

SELECT * FROM empvw30;

CREATE OR REPLACE VIEW empvw30 AS
SELECT employee_id e_id, first_name name, last_name surname, job_id 
    FROM employees WHERE department_id = 30;

CREATE OR REPLACE VIEW empvw30 AS
SELECT employee_id e_id, first_name||' '||last_name name, job_id 
    FROM employees WHERE department_id = 30;