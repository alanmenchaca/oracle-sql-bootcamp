-- ORACLE CONSTRAINTS IN SQL
-- NOT NULL Constraint
DESC jobs;
-- job_title don't accept null values
INSERT INTO jobs VALUES (100, null, 1, 10000); 
INSERT INTO jobs (job_id, min_salary, max_salary) VALUES(100, 1, 10000);

INSERT INTO jobs VALUES (100, 'My_Job', 1, 10000);
INSERT INTO jobs (job_id, job_title, min_salary, max_salary) 
    VALUES (100, 'My_Job', 1, 10000);

CREATE TABLE managers (
    manager_id      NUMBER NOT NULL,
    first_name      VARCHAR2(50),
    last_name       VARCHAR2(50) CONSTRAINT lname_nn NOT NULL,
    department_id   NUMBER NOT NULL
);

DESC managers;

-- UNIQUE Constraint
DROP TABLE managers;
CREATE TABLE managers (
    -- Column-level uniqueness constraints ensure uniqueness within
    -- each specified column.
    manager_id     NUMBER CONSTRAINT mgr_mid_uk UNIQUE,
    first_name     VARCHAR2(50),
    last_name      VARCHAR2(50),
    department_id  NUMBER NOT NULL,
    phone_number   VARCHAR2(11) CONSTRAINT pnum_uk UNIQUE 
                                CONSTRAINT pnum_nn NOT NULL,
    email          VARCHAR2(100),
    -- Table-level uniqueness constraints ensure uniqueness based on
    -- the combination of values across all specified columns.
    CONSTRAINT mgr_composite_uk UNIQUE(first_name, last_name, department_id)
);

INSERT INTO managers VALUES (100, 'Alex', 'Brown', 80);
INSERT INTO managers VALUES (101, 'Alex', 'Brown', 80);

INSERT INTO managers VALUES (101, 'Alex', 'Brown', 80, '123-456-789', 'abrown');
INSERT INTO managers VALUES (101, 'Alex', 'Brown', 99, '123-456-780', 'abrown');
INSERT INTO managers VALUES (null, null, null, 99, '123-456-781', null);

SELECT * FROM managers;


-- PRIMARY KEY Constraint
-- Primary Key = Unique + Not Null
CREATE TABLE directors (
    director_id    NUMBER CONSTRAINT dir_did_pk PRIMARY KEY,
    first_name     VARCHAR2(50),
    last_name      VARCHAR2(50)
);

CREATE TABLE executives (
    executive_id   NUMBER,
    first_name     VARCHAR2(50),
    last_name      VARCHAR2(250),
    -- table level composed primary key
    CONSTRAINT exec_eid_pk PRIMARY KEY(executive_id, last_name)
);

INSERT INTO directors VALUES(100, 'John', 'Goodman');
-- executive_id and last_name are table level composed primary
-- key and cannot be null values into any of them.
INSERT INTO executives VALUES(101, 'John', null);

DROP TABLE directors;
DROP TABLE executives;


-- FOREIGN KEYS Constraint
CREATE TABLE managers (
    manager_id     NUMBER CONSTRAINT mgr_mid_pk PRIMARY KEY,
    first_name     VARCHAR2(50),
    last_name      VARCHAR2(50),
    department_id  NUMBER CONSTRAINT did_nn NOT NULL,
    phone_number   VARCHAR2(11) CONSTRAINT pnum_uk UNIQUE 
                                CONSTRAINT pnum_nn NOT NULL,
    email          VARCHAR2(100) CONSTRAINT email_uk UNIQUE,
    -- While creating a table using CTAS Statements, only NOT
    -- NULL constraints will be copied from the original table.
    CONSTRAINT mgr_emp_fk FOREIGN KEY (manager_id)
        REFERENCES employees_copy(employee_id)
);

DROP TABLE managers;
DROP TABLE employees_copy;

CREATE TABLE employees_copy (
    employee_id     NUMBER(6) CONSTRAINT emp_copy_eid_pk PRIMARY KEY,
    first_name      VARCHAR2(20),
    last_name       VARCHAR2(20),
    department_id   NUMBER(4)
);

INSERT INTO employees_copy 
    SELECT employee_id, first_name, last_name, department_id
    FROM employees;

-- If the Foreign Key to insert doesn't exists in the parent table, 
-- we will have an error.
-- ORA-02291: integrity constraint (HR.MGR_EMP_FK) violated - parent key not found
INSERT INTO managers VALUES (80, 'John', 'King', 90, '123-456-789', 'jking');
-- We get the same error if we try to update the manager_id with a value
-- that doesn't exists in the parent table.
UPDATE managers SET manager_id = 70 WHERE manager_id = 100;

-- One important point it that we cannot delete or change an existing
-- parent key while a child record points to that value.
-- ORA-02292: integrity constraint (HR.MGR_EMP_FK) violated - child record found
INSERT INTO managers VALUES (100, 'John', 'King', 90, '123-456-789', 'jking');
DELETE FROM employees_copy WHERE employee_id = 100;
UPDATE employees_copy SET employee_id = 80 WHERE employee_id = 100;

-- Composite Foreign Key Constraint
CREATE TABLE employees_copy (
    employee_id     NUMBER(6) CONSTRAINT emp_copy_eid_pk PRIMARY KEY,
    first_name      VARCHAR2(20),
    last_name       VARCHAR2(20),
    department_id   NUMBER(4),
    CONSTRAINT emp_copy_names_uk UNIQUE (first_name, last_name)
);

CREATE TABLE managers (
    manager_id     NUMBER CONSTRAINT mgr_mid_uk PRIMARY KEY,
    first_name     VARCHAR2(50),
    last_name      VARCHAR2(50),
    department_id  NUMBER CONSTRAINT did_nn NOT NULL,
    phone_number   VARCHAR2(11) CONSTRAINT pnum_uk UNIQUE 
                                CONSTRAINT pnum_nn NOT NULL,
    email          VARCHAR2(100) CONSTRAINT email_uk UNIQUE,
    CONSTRAINT mgr_emp_fk FOREIGN KEY (manager_id)
        REFERENCES employees_copy(employee_id),
    CONSTRAINT mgr_names_fk FOREIGN KEY (first_name, last_name)
        REFERENCES employees_copy(first_name, last_name)    
);


-- "ON DELETE CASCADE" | "ON DELETE SET NULL" Options
DROP TABLE managers;
DROP TABLE employees_copy;

CREATE TABLE employees_copy (
    employee_id     NUMBER(6) CONSTRAINT emp_copy_eid_pk PRIMARY KEY,
    first_name      VARCHAR2(20),
    last_name       VARCHAR2(20),
    department_id   NUMBER(4)
);

INSERT INTO employees_copy 
    SELECT employee_id, first_name, last_name, department_id
    FROM employees;

CREATE TABLE managers (
    manager_id     NUMBER CONSTRAINT mgr_mid_uk UNIQUE,
    first_name     VARCHAR2(50),
    last_name      VARCHAR2(50),
    department_id  NUMBER CONSTRAINT did_nn NOT NULL,
    phone_number   VARCHAR2(11) CONSTRAINT pnum_uk UNIQUE 
                                CONSTRAINT pnum_nn NOT NULL,
    email          VARCHAR2(100) CONSTRAINT email_uk UNIQUE,
    CONSTRAINT mgr_emp_fk FOREIGN KEY (manager_id)
        -- We can set "ON DELETE CASCADE" OR "ON DELETE SET NULL"
        REFERENCES employees_copy(employee_id) ON DELETE CASCADE
);

CREATE TABLE employees_copy AS SELECT * FROM employees;
INSERT INTO managers VALUES (103, 'John', 'King', 90, '123-456-789', 'jking');
INSERT INTO managers VALUES (104, 'John2', 'King', 90, '123-456-780', 'jking2');
INSERT INTO managers VALUES (105, 'John3', 'King', 90, '123-456-781', 'jking3');

-- ORA-02292: integrity constraint (HR.MGR_EMP_FK) violated - child record found
DELETE FROM employees_copy WHERE employee_id = 103;

SELECT * FROM employees_copy;
SELECT * FROM managers;


-- CHECK constraint
CREATE TABLE managers2 (
    manager_id  NUMBER,
    first_name  VARCHAR2(50),
    salary      NUMBER,
    email       VARCHAR2(100),
    CONSTRAINT demo_check CHECK (salary > 100 AND salary < 50000
                                 AND UPPER(email) LIKE '%.COM')
);

-- ORA-02290: check constraint (HR.SALARY_CHECK) violated
INSERT INTO managers2 VALUES (1, 'Steven', 50); -- invalid
INSERT INTO managers2 VALUES (1, 'Steven', 2500); -- valid

-- ORA-02290: check constraint (HR.DEMO_CHECK) violated
INSERT INTO managers2 VALUES (1, 'Steven', 2500, 'thisisademoemail'); -- invalid
INSERT INTO managers2 VALUES (1, 'Steven', 2500, 'thisisademoemail.com'); -- valid

-- ORA-02290: check constraint (HR.SALARY_CHECK) violated
UPDATE managers2 SET salary = 20 WHERE manager_id = 1;


-- Adding Constraints via ALTER TABLE
DROP TABLE managers;
DROP TABLE employees_copy;
CREATE TABLE employees_copy AS SELECT * FROM employees;

ALTER TABLE employees_copy ADD CONSTRAINT emp_cpy_email_uk UNIQUE (email);
-- Adding a new constraint on multiple columns
ALTER TABLE employees_copy ADD CONSTRAINT emp_cpy_names_uk UNIQUE (first_name, last_name);
ALTER TABLE employees_copy ADD UNIQUE (phone_number);
-- ORA-02293: cannot validate (HR.) - check constraint violated 
-- NOTE: Existing rows shouldn't violate the constraint!
ALTER TABLE employees_copy ADD CHECK (salary >= 1000);
ALTER TABLE employees_copy ADD CHECK (salary >= 10000);
ALTER TABLE employees_copy ADD CONSTRAINT emp_cpy_emp_id_pk PRIMARY KEY (employee_id);
ALTER TABLE employees_copy ADD CONSTRAINT emp_cpy_dept_fk 
    FOREIGN KEY (department_id) REFERENCES departments(department_id);
    
-- To add a NOT NULL CONSTRAINT, we use the ALTER TABLE MODIFY COLUMN clause.    
ALTER TABLE employees_copy MODIFY salary CONSTRAINT emp_cpy_salary_nn NOT NULL;
ALTER TABLE employees_copy MODIFY first_name NOT NULL;
