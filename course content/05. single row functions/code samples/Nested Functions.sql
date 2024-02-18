/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : Nested Functions 								*
 ************************************************************/

SELECT SUBSTR('John Smith', INSTR('John Smith', ' ')+1,LENGTH('John Smith')) output 
FROM dual;

SELECT SUBSTR('John Smith', INSTR('John Smith', ' ')+1) output 
FROM dual;

SELECT first_name|| ' ' || last_name full_name, 
SUBSTR(first_name|| ' ' || last_name, 
              INSTR(first_name|| ' ' || last_name, ' ')+1) output 
FROM employees;

SELECT first_name|| ' ' || last_name full_name, 
SUBSTR(concat(concat(first_name,' '),last_name), 
              INSTR(first_name|| ' ' || last_name, ' ')+1) output 
FROM employees;

