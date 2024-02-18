/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : Using Subqueries as a Table                    *
 ***********************************************************/
 
SELECT *
FROM (SELECT department_id, department_name, state_province, city
      FROM departments JOIN locations
      USING (location_id)
      ORDER BY department_id);
               
SELECT manager_id
FROM (SELECT department_id, department_name, state_province, city
      FROM departments JOIN locations
      USING (location_id)
      ORDER BY department_id);

SELECT manager_id 
FROM (SELECT *
      FROM departments JOIN locations
      USING (location_id)
      ORDER BY department_id);

SELECT e.employee_id, e.first_name, e.last_name, b.department_name, b.city, b.state_province
FROM employees e JOIN (SELECT department_id, department_name, state_province, city
                       FROM departments JOIN locations
                       USING (location_id)
                       ORDER BY department_id) b
USING (department_id);