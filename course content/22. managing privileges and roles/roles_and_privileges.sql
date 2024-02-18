-- MANAGING ORACLE PRIVILAGES AND ROLES
-- How to create a user in oracle database?
CREATE USER temp_user IDENTIFIED BY 123; -- Local User
-- We cannot use CONTAINER = ALL when we're connected to
-- to a pluggable db.
CREATE USER temp_user IDENTIFIED BY 123
PASSWORD EXPIRE ACCOUNT UNLOCK CONTAINER = CURRENT;
DROP USER temp_user CASCADE;

SELECT * FROM dba_users;
SELECT * FROM all_users;
GRANT CREATE SESSION TO temp_user;


-- Changing a Database User's Password
-- Ordinary users cannot change other users' passwords!
ALTER USER temp_user IDENTIFIED BY abc123;


-- Granting System Privileges
SELECT * FROM system_privilege_map;
GRANT CREATE TABLE, CREATE VIEW TO temp_user
WITH ADMIN OPTION CONTAINER = CURRENT;


-- Roles and PUBLIC 
-- statements as system user
CREATE ROLE developer;
GRANT CREATE SESSION, CREATE SEQUENCE, CREATE TABLE TO developer;
SELECT * FROM dba_sys_privs WHERE grantee = 'DEVELOPER';
SELECT * FROM dba_sys_privs WHERE grantee = 'TEMP_USER'; 
GRANT CREATE SYNONYM TO developer;

GRANT CREATE SYNONYM TO temp;
CREATE ROLE test_role IDENTIFIED BY 123;
GRANT test_role TO temp_user;
GRANT SELECT ANY TABLE TO test_role;
DROP ROLE test_role;

-- statements as temp_user
CREATE SEQUENCE temp_seq; 
DROP SEQUENCE temp_seq;
SELECT * FROM user_role_privs;
SELECT * FROM session_privs;
CREATE SYNONYM temp_synonym FOR temp_table;
SET ROLE test_role IDENTIFIED BY 123, developer;
SET ROLE ALL;
SET ROLE NONE;
SET ROLE ALL EXCEPT test_role;
SELECT * FROM hr.employees;


-- Granting Object Privileges
SELECT * FROM employees_copy;
GRANT SELECT, DELETE ON employees_copy TO temp_user, developer;
GRANT UPDATE (salary, commission_pct) ON employees_copy TO temp_user;
GRANT UPDATE ON employees_copy TO developer;
GRANT INSERT ON employees_copy TO PUBLIC;
GRANT ALL ON employees_copy TO temp_user;
GRANT UNLIMITED TABLESPACE TO temp_user;


-- Revoking Object Privileges
SELECT * FROM dba_sys_privs WHERE grantee = 'TEMP_USER';
SELECT * FROM dba_tab_privs WHERE grantee = 'TEMP_USER';
SELECT * FROM dba_role_privs WHERE grantee = 'TEMP_USER';

REVOKE CREATE VIEW FROM temp_user;
REVOKE ALTER ON hr.employees_copy FROM temp_user;
REVOKE REFERENCES ON hr.employees_copy FROM temp_user CASCADE CONSTRAINT;
REVOKE DELETE, UPDATE ON hr.employees_copy FROM temp_user, developer;

GRANT SELECT ON redo_db TO hr WITH GRANT OPTION;
SELECT * FROM dba_tab_privs WHERE grantee = 'HR';

REVOKE SELECT ON redo_db FROM hr;
REVOKE developer FROM temp_user;
