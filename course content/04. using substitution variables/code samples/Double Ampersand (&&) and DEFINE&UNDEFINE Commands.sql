/************* The Complete Oracle SQL Bootcamp ****************
 * Author  : Oracle Master Training                            *
 * Course  : The Complete Oracle SQL Bootcamp                  *
 * Lecture : Double Ampersand (&&) and DEFINE&UNDEFINE Commands*
 ***************************************************************/

SELECT employee_id, first_name, last_name, salary
FROM employees 
WHERE salary BETWEEN &sal AND &sal + 1000; 

SELECT employee_id, first_name, last_name, salary
FROM employees 
WHERE salary BETWEEN &&sal AND &sal + 1000; 

SELECT employee_id, first_name, last_name, &&column_name 
FROM employees
ORDER BY &column_name;

SELECT &&column_name 
FROM employees
GROUP BY &column_name
ORDER BY &column_name;

DEFINE emp_num = 100;
SELECT * FROM employees WHERE employee_id = &emp_num;
DEFINE emp_num = 200;
DEFINE column_name = 'first_name';
UNDEFINE emp_num;
DEFINE;
DEFINE column_name;
UNDEF column_name;
DEF column_name;	