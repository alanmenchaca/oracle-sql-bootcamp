/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : Using Sequences                                *
 ************************************************************/

DROP SEQUENCE employee_seq;
CREATE SEQUENCE employee_seq 
START WITH 100 
INCREMENT BY 3
MAXVALUE 99999 
CACHE 30 
NOCYCLE; 

SELECT employee_seq.CURRVAL FROM dual;
SELECT employee_seq.NEXTVAL FROM dual;

INSERT INTO employees (employee_id, last_name, email, hire_date, job_id)
            VALUES (employee_seq.NEXTVAL, 'Smith','SMITH5',sysdate,'IT_PROG');

SELECT * FROM employees;

SELECT employee_seq.NEXTVAL FROM employees;