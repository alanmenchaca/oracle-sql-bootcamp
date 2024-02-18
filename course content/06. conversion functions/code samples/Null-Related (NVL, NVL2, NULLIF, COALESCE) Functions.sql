/************* The Complete Oracle SQL Bootcamp *********************
 * Author  : Oracle Master Training                         		*
 * Course  : The Complete Oracle SQL Bootcamp               		*
 * Lecture : Null-Related (NVL, NVL2, NULLIF, COALESCE) Functions	*
 ********************************************************************/

SELECT employee_id, salary, commission_pct, salary + salary * commission_pct 
FROM employees;

SELECT employee_id, salary, commission_pct, salary + salary * nvl(commission_pct,0) nvl_new_sal 
FROM employees;

SELECT first_name, last_name, 
length(first_name) len1, length(first_name) len2, 
nullif(length(first_name),length(last_name)) result
FROM employees;

SELECT coalesce(null,null,null,1,2,3, null) FROM dual;
SELECT coalesce(null,null,null,null) FROM dual;

SELECT state_province, city, coalesce(state_province,city) FROM locations;