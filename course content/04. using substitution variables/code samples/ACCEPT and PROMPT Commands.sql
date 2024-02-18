/************* The Complete Oracle SQL Bootcamp ****************
 * Author  : Oracle Master Training                            *
 * Course  : The Complete Oracle SQL Bootcamp                  *
 * Lecture : ACCEPT and PROMPT Commands                        *
 ***************************************************************/

ACCEPT emp_id PROMPT 'Please Enter a valid Employee ID:';

SELECT employee_id, first_name, last_name, salary
FROM employees
WHERE employee_id = &emp_id;

UNDEFINE emp_id;

ACCEPT min_salary PROMPT 'Please specify the MINIMUM salary:'
ACCEPT max_salary PROMPT 'Please specify the MAXIMUM salary:'
SELECT employee_id, last_name, salary 
FROM employees
WHERE salary BETWEEN &min_salary AND &max_salary;
UNDEFINE min_sal;
UNDEF max_sal;