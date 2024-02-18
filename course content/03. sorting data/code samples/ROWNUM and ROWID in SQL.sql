/************* The Complete Oracle SQL Bootcamp ****************
 * Author  : Oracle Master Training                            *
 * Course  : The Complete Oracle SQL Bootcamp                  *
 * Lecture : ROWNUM and ROWID in SQL                           *
 ***************************************************************/

SELECT employee_id, first_name, last_name, salary, rowid, rownum from employees;
SELECT employee_id, first_name, last_name, salary, rowid, rownum from employees where department_id = 60;
SELECT employee_id, first_name, last_name, salary, rowid, rownum from employees where department_id = 80;
SELECT employee_id, first_name, last_name, salary, rowid, rownum from employees 
       WHERE department_id = 80 and rownum <= 5 order by salary desc;
