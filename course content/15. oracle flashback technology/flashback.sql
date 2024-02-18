-- ORACLE FLASHBACK TECHNOLOGY
-- Flashback Operations
CREATE TABLE employees_copy AS SELECT * FROM employees;
-- DROP TABLE employees_copy;

SELECT * FROM recyclebin;
SELECT * FROM employees_copy;

DELETE FROM employees_copy WHERE salary > 5000;

-- Get employees_copy data before 5 minutes
ALTER TABLE employees_copy ENABLE ROW MOVEMENT;
FLASHBACK TABLE employees_copy TO TIMESTAMP sysdate - 5 / (24*60);

SELECT dbms_flashback.get_system_change_number AS scn FROM dual; -- 3893611
FLASHBACK TABLE employees_copy TO SCN 3893611;

INSERT INTO employees_copy SELECT * FROM employees;
UPDATE employees_copy SET salary = 10000;

SELECT ora_rowscn, first_name FROM employees_copy;
UPDATE employees_copy SET first_name = 'Farah' WHERE first_name = 'Sarah';

-- ALL DDL commands are auto-commited by default.
FLASHBACK TABLE hr.employees_copy TO BEFORE DROP;

CREATE TABLE hr.employees_copy AS SELECT * FROM hr.employees;
CREATE RESTORE POINT rp_test;

ALTER TABLE hr.employees_copy ENABLE ROW MOVEMENT;
FLASHBACK TABLE hr.employees_copy TO RESTORE POINT rp_test;
SELECT * FROM hr.employees_copy;

SELECT * FROM v$restore_point;
DROP RESTORE POINT rp_test;


-- RECYCLE BIN & PURGE Operatio ns
-- If we dont want a table to be stored in the RECYCLE BIN,
-- we need to drop that table with the PURGE option.
DROP TABLE employees_copy PURGE;
SELECT * FROM recyclebin;

-- If we want to remove a table from the recycle bin as well, then
-- we can remove that dropped table from the recycle bin by writing:
PURGE TABLE employees_copy;

-- Warning: We can purge the whole RECYCLE BIN by using the 
-- following code:
PURGE RECYCLEBIN;
FLASHBACK TABLE employees_copy TO BEFORE DROP;


-- Tracking Changes in Data
CREATE TABLE employees_copy AS SELECT * FROM employees;
DROP TABLE employees_copy;

-- Flashback Query: Retrieves data that existed at a specific
-- time in the past.
SELECT dbms_flashback.get_system_change_number AS scn FROM dual; -- 4011665
UPDATE employees_copy SET salary = 18000 WHERE employee_id = 100;

SELECT * FROM employees_copy AS OF TIMESTAMP(sysdate - interval '1' minute)
WHERE employee_id = 100;

SELECT * FROM employees_copy AS OF scn 4011665
WHERE employee_id = 100;

UPDATE employees_copy SET salary = 15000 WHERE employee_id = 100;
UPDATE employees_copy SET salary = 10000 WHERE employee_id = 100;

-- There are some important pseudocolumns that can be used with 
-- the versions query:
SELECT versions_starttime, versions_endtime, versions_startscn, versions_endscn,
       versions_operation, versions_xid, employees_copy.*
FROM employees_copy VERSIONS BETWEEN scn MINVALUE AND MAXVALUE
WHERE employee_id = 100; -- We cannot use a table alias with a version query

SELECT versions_starttime, versions_endtime, versions_startscn, versions_endscn,
       versions_operation, versions_xid, employees_copy.*
FROM employees_copy VERSIONS 
    BETWEEN TIMESTAMP(sysdate - interval '5' minute) AND sysdate
WHERE employee_id = 100; 
