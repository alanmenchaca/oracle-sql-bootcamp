/************ The Complete Oracle PL/SQL Bootcamp ***********
 * Author : Oracle Master Training                          *
 * Course : The Complete Oracle PL/SQL Bootcamp             *
 * Lecture: How to Create a User in Oracle Database         *
 ************************************************************/

CREATE USER temp_user IDENTIFIED BY 123;
DROP USER temp_user;
CREATE USER temp_user IDENTIFIED BY 123
PASSWORD EXPIRE ACCOUNT UNLOCK CONTAINER=ALL;
CREATE USER temp_user IDENTIFIED BY 123
PASSWORD EXPIRE ACCOUNT UNLOCK CONTAINER=CURRENT;
DROP USER temp_user CASCADE;
SELECT * FROM dba_users;
GRANT CREATE SESSION TO temp_user;
SELECT * FROM all_users;
SELECT * FROM user_users;
