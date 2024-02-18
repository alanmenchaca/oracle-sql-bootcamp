/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : TO_CHAR, TO_DATE, TO_NUMBER Functions (Part 1)	*
 ************************************************************/

SELECT first_name, hire_date FROM employees;
SELECT first_name, hire_date, to_char(hire_date,'YYYY') "Formatted Date" FROM employees;
SELECT first_name, hire_date, to_char(hire_date,'YY') "Formatted Date" FROM employees;
SELECT first_name, hire_date, to_char(hire_date,'RR') "Formatted Date" FROM employees;
SELECT first_name, hire_date, to_char(hire_date,'YEAR') "Formatted Date" FROM employees;
SELECT first_name, hire_date, to_char(hire_date,'MM') "Formatted Date" FROM employees;
SELECT first_name, hire_date, to_char(hire_date,'MM-YYYY') "Formatted Date" FROM employees;
SELECT first_name, hire_date, to_char(hire_date,'MON-YYYY') "Formatted Date" FROM employees;
SELECT first_name, hire_date, to_char(hire_date,'MON-yyyy') "Formatted Date" FROM employees;
SELECT first_name, hire_date, to_char(hire_date,'mon-yyyy') "Formatted Date" FROM employees;
SELECT first_name, hire_date, to_char(hire_date,'Mon-yyyy') "Formatted Date" FROM employees;
SELECT first_name, hire_date, to_char(hire_date,'MONTH-yyyy') "Formatted Date" FROM employees;
SELECT first_name, hire_date, to_char(hire_date,'Month-yyyy') "Formatted Date" FROM employees;
SELECT first_name, hire_date, to_char(hire_date,'DD-Month-yyyy') "Formatted Date" FROM employees;
SELECT first_name, hire_date, to_char(hire_date,'DY-Month-yyyy') "Formatted Date" FROM employees;
SELECT first_name, hire_date, to_char(hire_date,'Dy-Month-yyyy') "Formatted Date" FROM employees;
SELECT first_name, hire_date, to_char(hire_date,'Day-Month-yyyy') "Formatted Date" FROM employees;
SELECT first_name, hire_date, to_char(hire_date,'Dy-Month-yyyy HH12') "Formatted Date" FROM employees;
SELECT first_name, hire_date, to_char(hire_date,'Dy-Month-yyyy HH24') "Formatted Date" FROM employees;
SELECT first_name, hire_date, to_char(hire_date,'Dy-Month-yyyy HH24:MI') "Formatted Date" FROM employees;
SELECT first_name, hire_date, to_char(hire_date,'Dy-Month-yyyy HH24:MI:SS') "Formatted Date" FROM employees;
SELECT first_name, hire_date, to_char(sysdate,'Dy-Month-yyyy HH24:MI:SS') "Formatted Date" FROM employees;
SELECT first_name, hire_date, to_char(hire_date,'DDTH-Month-yyyy HH24:MI:SS') "Formatted Date" FROM employees;
SELECT first_name, hire_date, to_char(hire_date,'DDTH-MMTH-yyyy HH24:MI:SS') "Formatted Date" FROM employees;
SELECT first_name, hire_date, to_char(hire_date,'DDSP-MMTH-yyyy HH24:MI:SS') "Formatted Date" FROM employees;
SELECT first_name, hire_date, to_char(hire_date,'DDSPTH-MMTH-yyyy HH24:MI:SS') "Formatted Date" FROM employees;
SELECT first_name, hire_date, to_char(hire_date,'DDTHSP-MMTH-yyyy HH24:MI:SS') "Formatted Date" FROM employees;

