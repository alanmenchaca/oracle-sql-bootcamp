/************ The Complete Oracle PL/SQL Bootcamp ***********
 * Author : Oracle Master Training                          *
 * Course : The Complete Oracle PL/SQL Bootcamp             *
 * Lecture: Granting System Privileges                      *
 ************************************************************/

--temp_user Worksheet Code:
SELECT * FROM user_sys_privs;
SELECT * FROM dba_sys_privs;
CREATE TABLE temp_table(temp_column NUMBER);
SELECT * FROM session_privs;

--sys Worksheet Code:
SELECT * FROM system_privilege_map;
GRANT CREATE TABLE, CREATE VIEW TO temp_user WITH ADMIN OPTION CONTAINER = ALL;
GRANT CREATE TABLE, CREATE VIEW TO temp_user WITH ADMIN OPTION CONTAINER = CURRENT;

