/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : EXISTS Operator & Semijoins                    *
 ***********************************************************/
 
SELECT employee_id, first_name, last_name, department_id, salary FROM employees a
WHERE EXISTS 
            (SELECT * FROM employees WHERE manager_id = a.employee_id);

SELECT employee_id, first_name, last_name, department_id, salary FROM employees a
WHERE EXISTS 
            (SELECT null FROM employees WHERE manager_id = a.employee_id);

SELECT employee_id, first_name, last_name, department_id, salary FROM employees a
WHERE EXISTS 
            (SELECT commission_pct*10 FROM employees WHERE manager_id = a.employee_id);