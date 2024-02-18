/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : The Dictionary View                            *
 ************************************************************/

SELECT * FROM dictionary;

SELECT * FROM dict;

SELECT * FROM dict WHERE table_name = 'USER_CONSTRAINTS';

SELECT * FROM dict WHERE upper(comments) LIKE '%CONSTRAINT%';