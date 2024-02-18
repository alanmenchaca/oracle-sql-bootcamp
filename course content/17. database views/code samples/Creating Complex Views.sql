/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : Creating Complex Views                         *
 ************************************************************/

CREATE VIEW emp_cx_vw (DNAME, MIN_SAL, MAX_SAL) AS
    SELECT distinct upper(department_name), min(salary), max(salary)
    FROM employees e JOIN departments d
    USING(department_id)
    GROUP BY department_name;
SELECT * FROM emp_cx_vw;