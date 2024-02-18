/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : Self Join										*
 ************************************************************/
 
SELECT first_name, last_name, employee_id, manager_id
FROM employees worker JOIN employees manager
ON(worker.manager_id = manager.employee_id);
 
SELECT worker.first_name, worker.last_name, worker.employee_id, worker.manager_id,
       manager.employee_id, manager.first_name, manager.last_name
FROM employees worker JOIN employees manager
ON(worker.manager_id = manager.employee_id);
 
SELECT worker.first_name, worker.last_name, worker.employee_id, worker.manager_id,
       manager.employee_id, manager.first_name, manager.last_name, 
       worker.salary, manager.salary
FROM employees worker JOIN employees manager
ON(worker.manager_id = manager.employee_id);