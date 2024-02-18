-- ORACLE SYNONYMS
-- Creating, Using and Dropping Synonyms
CREATE OR REPLACE SYNONYM test_syn FOR departments;
SELECT * FROM hr.test_syn;
SELECT * FROM test_syn;

DROP SYNONYM test_syn;
CREATE SYNONYM test_syn FOR sys.user_objects;
CREATE OR REPLACE PUBLIC SYNONYM test_syn FOR hr.employees;
CREATE OR REPLACE PUBLIC SYNONYM test_syn FOR system.redo_db;

CREATE PUBLIC SYNONYM employees FOR hr.employees;
CREATE SYNONYM employees2 FOR departments22;

-- ORA-00980: synonym translation is no longer valid
-- we get this error if we create a synonym for a non-existen
-- object o remove the related table later on.
SELECT * FROM employees2;
-- to remove a public synonym, we must have the 
-- related privileges
DROP PUBLIC SYNONYM test_syn; -- removed using system user
DROP PUBLIC SYNONYM employees; -- removed using system user
DROP SYNONYM employees2;


-- Analyzing the USER_SYNONYMS View
DESCRIBE user_synonyms;

CREATE SYNONYM emps FOR employees;
SELECT * FROM user_synonyms;
-- EMPS 	HR	EMPLOYEES		3
SELECT * FROM dba_synonyms;

DROP SYNONYM emps;
