/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : Conversion Functions in SQL             		*
 ************************************************************/

--Implicit Conversion FROM a VARCHAR2 value TO a "NUMBER" value.
SELECT * FROM EMPLOYEES WHERE salary > '5000';

--Implicit Conversion FROM a VARCHAR2 value TO a "DATE" value. 
SELECT * FROM EMPLOYEES WHERE HIRE_DATE = '17-JUN-03';

--Implicit Conversion FROM a NUMBER value TO a VARCHAR2 value. 
SELECT DEPARTMENT_ID || DEPARTMENT_NAME FROM DEPARTMENTS;

--Implicit Conversion FROM a DATE value TO a VARCHAR2 value. 
SELECT FIRST_NAME || SYSDATE FROM EMPLOYEES;