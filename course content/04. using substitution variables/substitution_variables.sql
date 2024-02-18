-- Substitution variables
SELECT employee_id, first_name, last_name, department_id
    FROM employees WHERE department_id = &department_no;
    
SELECT employee_id, first_name, last_name, department_id
    FROM employees WHERE first_name = '&name';

/* We can use more than one substitution variable at various
   places in an SQL statement like: */
SELECT employee_id, first_name, last_name, &column_name
    FROM &table_name
    WHERE &condition
    ORDER BY &order_by_clause;
    
-- DEFINE & UNDEFINE Commands
SELECT employee_id, first_name, last_name, salary
    FROM employees
    WHERE salary BETWEEN &&sal AND &sal + 1000; 
    
SELECT employee_id, first_name, last_name, &&column_name
    FROM employees
    ORDER BY &column_name;
    
DEFINE column_name = 'first_name';
SELECT &&column_name
    FROM employees
    GROUP BY &column_name
    ORDER BY &column_name;
    
DEFINE emp_num = 200;
SELECT * FROM employees WHERE employee_id = &emp_num;
UNDEFINE emp_num;

DEFINE; -- SHOW ALL THE DEFINED SUBSTITUTION VARIABLES.
DEFINE _O_VERSION;

-- ACCEPT/PROMPT
ACCEPT emp_id PROMPT 'Please Enter a valid Employee ID:';
SELECT employee_id, first_name, last_name salary
    FROM employees
    WHERE employee_id = &emp_id;
DEFINE emp_id;

ACCEPT min_salary PROMPT 'Please specify the MINIMUM salary:';
ACCEPT max_salary PROMPT 'Please specify the MAXIMUM salary:';
SELECT employee_id, first_name, last_name, salary
    FROM employees
    WHERE salary BETWEEN &min_salary AND &max_salary;
UNDEFINE min_salary;
UNDEFINE max_salary;

-- SET VERIFY ON/OFF
SET VERIFY ON;
SELECT employee_id, first_name, last_name
    FROM employees
    WHERE employee_id = &emp_id;
SET VERIFY OFF;

SET DEFINE OFF;
SELECT * FROM departments WHERE department_name = 'R&D';
SET DEFINE ON;
