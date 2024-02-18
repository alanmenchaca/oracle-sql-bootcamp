/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : Modifying Sequences                            *
 ************************************************************/

CREATE SEQUENCE employee_seq
START WITH 100
INCREMENT BY 2
MAXVALUE 99999
CACHE 30
NOCYCLE;

ALTER SEQUENCE employee_seq
START WITH 100
INCREMENT BY 5
MAXVALUE 99999
CACHE 30
NOCYCLE;

ALTER SEQUENCE employee_seq
INCREMENT BY 5
MAXVALUE 99999
CACHE 30
NOCYCLE;

ALTER SEQUENCE employee_seq
INCREMENT BY 4
NOCYCLE;
