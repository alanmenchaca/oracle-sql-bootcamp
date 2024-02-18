/************* The Complete Oracle SQL Bootcamp ****************
 * Author  : Oracle Master Training                            *
 * Course  : The Complete Oracle SQL Bootcamp                  *
 * Lecture : Row Lock in Oracle                                *
 ***************************************************************/

UPDATE employees_copy
SET salary = salary + 500
WHERE employee_id = 102;

SELECT employee_id,first_name,last_name,salary 
FROM employees_copy 
WHERE employee_id = 102;  

UPDATE employees_copy
SET salary = salary + 500
WHERE employee_id = 103;

UPDATE hr.employees_copy
SET salary = salary + 1000
WHERE employee_id = 102;

UPDATE employees_copy
SET first_name = 'Alex'
WHERE employee_id = 102;
