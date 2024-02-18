/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : Analyzing The USER_SYNONYMS View               *
 ************************************************************/

DESCRIBE user_synonyms;

SELECT * FROM user_synonyms;

CREATE SYNONYM emps FOR employees;

SELECT * FROM dba_synonyms;

DROP SYNONYM emps;