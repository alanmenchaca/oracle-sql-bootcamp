/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : Creating Sequences                             *
 ************************************************************/

CREATE SEQUENCE employee_seq
START WITH 100
INCREMENT BY 3
MAXVALUE 50
CACHE 30
NOCYCLE;
 
CREATE SEQUENCE employee_seq
START WITH 100
INCREMENT BY 3
MAXVALUE 99999
CACHE 30
NOCYCLE;