/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : FLASHBACK Operations                           *
 ************************************************************/

SELECT * FROM recyclebin;

SELECT * FROM employees_copy;

DELETE FROM employees_copy WHERE salary > 5000;

FLASHBACK TABLE employees_copy TO TIMESTAMP sysdate - 5/(24*60);

ALTER TABLE employees_copy ENABLE ROW MOVEMENT;

SELECT dbms_flashback.get_system_change_number AS scn FROM dual;

FLASHBACK TABLE hr.employees_copy TO RESTORE POINT rp_test;

INSERT INTO employees_copy SELECT * FROM employees;

UPDATE employees_copy SET salary = 10000;

SELECT ora_rowscn, first_name FROM employees_copy;

UPDATE employees_copy 
   SET first_name = 'Farah' 
 WHERE first_name = 'Sarah';

DROP TABLE employees_copy;

--Replace your dropped object name within double quotes.
SELECT * FROM "BIN$b3i6rakGQtC2nTeGnRs9SQ==$0"; 

FLASHBACK TABLE employees_copy TO BEFORE DROP;

CREATE RESTORE POINT rp_test;
FLASHBACK TABLE hr.employees_copy TO RESTORE POINT rp_test;

SELECT * FROM V$RESTORE_POINT;





