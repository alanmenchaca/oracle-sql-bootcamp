/************* The Complete Oracle SQL Bootcamp ****************
 * Author  : Oracle Master Training                            *
 * Course  : The Complete Oracle SQL Bootcamp                  *
 * Lecture : COMMIT and ROLLBACK Statements                    *
 ***************************************************************/

SELECT * FROM employees_copy;
DELETE employees_copy WHERE job_id = 'SA_REP';
ROLLBACK;
UPDATE employees_copy SET first_name = 'John';
COMMIT;
UPDATE employees_copy c 
SET first_name = 
    (SELECT first_name FROM employees e
     WHERE e.employee_id = c.employee_id);
INSERT INTO employees_copy
    (SELECT * FROM employees
     WHERE job_id = 'SA_REP');
CREATE TABLE temp (tmp DATE);
DROP TABLE temp;