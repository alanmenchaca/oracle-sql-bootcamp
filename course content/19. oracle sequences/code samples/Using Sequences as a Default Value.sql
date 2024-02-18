/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : Using Sequences as a Default Value             *
 ************************************************************/

CREATE TABLE temp (e_id INTEGER DEFAULT employee_seq.NEXTVAL, first_name  VARCHAR2(50));
INSERT INTO temp(first_name) VALUES ('Alex');
SELECT * FROM temp;

DROP TABLE temp;

CREATE TABLE temp (e_id INTEGER DEFAULT employee_seq.CURRVAL, first_name  VARCHAR2(50));
SELECT employee_seq.NEXTVAL FROM dual;
INSERT INTO temp(e_id,first_name) VALUES(NULL,'Alex');