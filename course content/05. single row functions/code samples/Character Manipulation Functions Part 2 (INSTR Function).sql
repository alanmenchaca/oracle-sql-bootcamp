/************* The Complete Oracle SQL Bootcamp **********************
 * Author  : Oracle Master Training                                  *
 * Course  : The Complete Oracle SQL Bootcamp                        *
 * Lecture : Character Manipulation Functions Part 2 (INSTR Function)*
 *********************************************************************/

SELECT INSTR('I am learning how to use functions in Oracle', 'o', 17, 3) FROM dual; 
SELECT INSTR('I am learning how to use functions in Oracle', 'o', 1, 3) FROM dual;
SELECT INSTR('I am learning how to use functions in Oracle', 'o', -1, 3) FROM dual;
SELECT INSTR('I am learning how to use functions in Oracle', 'o', -1, 1) FROM dual;
SELECT INSTR('I am learning how to use functions in Oracle', 'in', -1, 1) FROM dual;
SELECT INSTR('I am learning how to use functions in Oracle', 'in', 1, 1) FROM dual;
SELECT first_name,INSTR(first_name,'a') from employees;