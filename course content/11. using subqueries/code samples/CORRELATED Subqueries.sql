/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : CORRELATED Subqueries                          *
 ***********************************************************/
 
--Previous Code:
SELECT employee_id, first_name, last_name, manager_id, department_id FROM employees 
WHERE (department_id, manager_id) IN (SELECT department_id, manager_id FROM employees WHERE first_name ='Luis'); 

--Example 1:
SELECT employee_id, first_name, last_name, department_id, salary 
FROM employees a 
WHERE salary = (SELECT max(salary) 
                FROM employees b 
                WHERE b.department_id = a.department_id);

SELECT employee_id, first_name, last_name, department_id, salary 
FROM employees a 
WHERE (salary, department_id) IN (SELECT max(salary), department_id 
                                  FROM employees b 
                                  GROUP BY department_id);

SELECT employee_id, first_name, last_name, department_id, salary 
FROM employees a 
WHERE salary < (SELECT avg(salary) 
                FROM employees b 
                WHERE b.department_id = a.department_id);

SELECT employee_id, first_name, last_name, a.department_id, salary 
FROM employees a JOIN (SELECT avg(salary) avg_sal, department_id 
                       FROM employees 
                       GROUP BY department_id) b
ON a.department_id = b.department_id
WHERE a.salary < b.avg_sal;

--Example 2: 
SELECT employee_id, first_name, last_name, department_name, salary,
      (SELECT avg(salary)
       FROM employees
       WHERE department_id = d.department_id) "DEPARMENT'S AVERAGE SALARY"
FROM employees e JOIN departments d 
ON (d.department_id = e.department_id)
ORDER BY e.employee_id;

SELECT employee_id, first_name, last_name, department_name, salary,
      (SELECT round(avg(salary))
       FROM employees
       WHERE department_id = d.department_id) "DEPARMENT'S AVERAGE SALARY"
FROM employees e JOIN departments d 
ON (d.department_id = e.department_id)
ORDER BY e.employee_id;