/************* The Complete Oracle SQL Bootcamp ****************
 * Author  : Oracle Master Training                            *
 * Course  : The Complete Oracle SQL Bootcamp                  *
 * Lecture : What is a Substitution Variable                   *
 ***************************************************************/

SELECT employee_id, first_name, last_name, department_id
FROM employees WHERE department_id = 30;

SELECT employee_id, first_name, last_name, department_id
FROM employees WHERE department_id = &department_no;

SELECT employee_id, first_name, last_name, department_id
FROM employees WHERE first_name = '&name';

SELECT employee_id, first_name, last_name, department_id
FROM employees WHERE first_name = &name;

SELECT employee_id, first_name, last_name, &column_name
FROM &table_name 
WHERE &condition
ORDER BY &order_by_clause;