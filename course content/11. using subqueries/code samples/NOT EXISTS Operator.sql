/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : NOT EXISTS Operator                            *
 ***********************************************************/
 
SELECT * FROM departments d
WHERE NOT EXISTS
                 (SELECT department_id FROM employees e
                  WHERE e.department_id = d.department_id);

SELECT * FROM departments d
WHERE NOT EXISTS
                 (SELECT null FROM employees e
                  WHERE e.department_id = d.department_id);

SELECT *
	FROM departments d 
	WHERE department_id NOT IN
	   (SELECT department_id FROM employees);