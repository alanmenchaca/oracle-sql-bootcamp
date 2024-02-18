/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : MINUS Operator                                 *
 ************************************************************/

select first_name, last_name, email, hire_date, salary, job_id  from retired_employees
minus
select first_name, last_name, email, hire_date, salary, job_id from employees;

select first_name, last_name, email, hire_date, job_id  from retired_employees
minus
select first_name, last_name, email, hire_date, job_id from employees;

select first_name, last_name, email, hire_date, salary, job_id from employees
minus
select first_name, last_name, email, hire_date, salary, job_id  from retired_employees;

select first_name from employees
minus
select first_name from retired_employees;