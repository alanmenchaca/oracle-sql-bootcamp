/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : Analyzing USER_INDEXES, USER_IND_COLUMNS Views *
 ************************************************************/

SELECT * FROM user_indexes;
SELECT * FROM user_ind_columns;
SELECT * FROM user_ind_columns WHERE table_name = 'EMPLOYEES';
SELECT * FROM employees WHERE first_name = 'Steven';
SELECT * FROM employees WHERE last_name = 'King';
SELECT * FROM employees WHERE last_name = 'King' AND first_name = 'Steven';


