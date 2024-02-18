/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : Creating, Using, and Dropping Synonyms         *
 ************************************************************/

CREATE SYNONYM test_syn FOR employees;
SELECT * FROM test_syn;
CREATE OR REPLACE SYNONYM test_syn FOR departments;
DROP SYNONYM test_syn;
CREATE SYNONYM test_syn FOR SYS.user_objects;
SELECT * FROM hr.test_syn;

CREATE OR REPLACE PUBLIC SYNONYM test_syn FOR hr.employees;
CREATE OR REPLACE PUBLIC SYNONYM test_syn FOR SYSTEM.redo_db;

CREATE SYNONYM employees FOR employees;
CREATE PUBLIC SYNONYM employees FOR hr.employees;
CREATE SYNONYM employees FOR departments;
CREATE SYNONYM employees2 FOR departments22;
SELECT * FROM employees2;
DROP SYNONYM test_syn;
DROP SYNONYM employees2;
DROP PUBLIC SYNONYM test_syn;
DROP PUBLIC SYNONYM employees;