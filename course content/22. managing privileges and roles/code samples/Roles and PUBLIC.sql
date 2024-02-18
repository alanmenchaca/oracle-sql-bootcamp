/************ The Complete Oracle PL/SQL Bootcamp ***********
 * Author : Oracle Master Training                          *
 * Course : The Complete Oracle PL/SQL Bootcamp             *
 * Lecture: Roles & PUBLIC                                  *
 ************************************************************/
 
CREATE ROLE developer;
GRANT CREATE SESSION, CREATE SEQUENCE, CREATE TABLE TO developer;
SELECT * FROM dba_sys_privs WHERE GRANTEE = 'DEVELOPER';
SELECT * FROM dba_sys_privs WHERE GRANTEE = 'TEMP_USER';
GRANT developer TO temp_user;
CREATE SEQUENCE temp_seq;
SELECT * FROM user_role_privs;
SELECT * FROM 	session_privs;
CREATE SYNONYM temp_synonym FOR temp_table;
GRANT CREATE SESSION, CREATE SEQUENCE, CREATE TABLE, CREATE SYNONYM TO developer;
GRANT CREATE SYNONYM TO developer;
CREATE ROLE test_role IDENTIFIED BY 123;
GRANT test_role TO temp_user;
GRANT SELECT ANY TABLE TO test_role;
SET ROLE test_role IDENTIFIED BY 123;
SET ROLE ALL;
SET ROLE test_role IDENTIFIED BY 123, developer;
SET ROLE NONE;
SET ROLE ALL EXCEPT test_role;
SELECT * FROM hr.employees;
DROP ROLE test_role;