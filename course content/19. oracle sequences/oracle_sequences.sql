-- ORACLE SEQUENCES
-- Creating Sequences
-- START WITH cannot be more than MAXVALUE
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


-- Modifying Sequences
-- ORA-02283: cannot alter starting sequence number
ALTER SEQUENCE employee_seq
START WITH 100
INCREMENT BY 5
MAXVALUE 99999
CACHE 30
NOCYCLE;

-- Parameters not defined in the ALTER SEQUENCE 
-- statement, will remain the same. 
ALTER SEQUENCE employee_seq
INCREMENT BY 5
MAXVALUE 99999
CACHE 30
NOCYCLE;


-- Dropping Sequences
DROP SEQUENCE employee_seq;


-- Using Sequences
-- *Cause: sequence CURRVAL has been selected before sequence NEXTVAL
SELECT employee_seq.currval FROM dual;

SELECT employee_seq.NEXTVAL FROM dual;
SELECT employee_seq.CURRVAL FROM dual;
-- Single-row functions are executed once for each 
-- row that is returned by the SELECT statement.
SELECT employee_seq.NEXTVAL FROM employees;
 
INSERT INTO employees (employee_id, last_name, email, hire_date, job_id)
VALUES (employee_seq.NEXTVAL, 'Smith', 'SMITH5', sysdate, 'IT_PROG');


-- Using Sequences as Default Values
CREATE TABLE temp (
    e_id       NUMBER DEFAULT employee_seq.NEXTVAL NOT NULL,
    first_name VARCHAR2(50)
);
INSERT INTO temp(first_name) VALUES('Alex');
SELECT employee_seq.nextval FROM dual;


-- USER_SEQUENCE View
SELECT * FROM user_sequences;
-- To see all the sequences which the user has access.
SELECT * FROM all_sequences;
-- To see all the sequences in the entire database.
SELECT * FROM dba_sequences;


 -- Oracle IDENTITY
CREATE TABLE temp (
    ID NUMBER GENERATED AS IDENTITY,
    text VARCHAR2(100)
);
 
CREATE TABLE temp (
    ID NUMBER GENERATED ALWAYS AS IDENTITY,
    text VARCHAR2(100)
);

CREATE TABLE temp (
    ID NUMBER GENERATED BY DEFAULT AS IDENTITY,
    text VARCHAR2(100)
);

CREATE TABLE temp (
    ID NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY,
    text VARCHAR2(100)
);

CREATE TABLE temp (
    ID NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY
        START WITH 50 INCREMENT BY 3,
    text VARCHAR2(100)
);

DROP TABLE temp;
SELECT * FROM temp;

INSERT INTO temp (ID, text) VALUES (1, 'Test with 1');
INSERT INTO temp (ID, text) VALUES (20, 'Test with 20');
INSERT INTO temp (ID, text) VALUES (NULL, 'Test with NULL');
INSERT INTO temp (text) VALUES ('Test with No Value');

SELECT * FROM user_objects WHERE object_name = 'ISEQ$$_74543';
SELECT * FROM user_sequences WHERE sequence_name = 'ISEQ$$_74543';
SELECT ISEQ$$_74543.NEXTVAL FROM dual;
PURGE RECYCLEBIN;