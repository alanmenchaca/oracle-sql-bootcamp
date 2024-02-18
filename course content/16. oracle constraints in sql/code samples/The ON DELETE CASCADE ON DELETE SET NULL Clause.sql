/************* The Complete Oracle SQL Bootcamp ***************
 * Author  : Oracle Master Training                           *
 * Course  : The Complete Oracle SQL Bootcamp                 *
 * Lecture : The ON DELETE CASCADE  ON DELETE SET NULL Clause *
 **************************************************************/

DROP TABLE managers;
CREATE TABLE managers
    (manager_id    NUMBER CONSTRAINT mgr_mid_pk PRIMARY KEY,
     first_name    VARCHAR2(50),
     last_name     VARCHAR2(50),
     department_id NUMBER NOT NULL,
     phone_number  VARCHAR2(11) UNIQUE NOT NULL,
     email         VARCHAR2(100),
     UNIQUE(email),
     CONSTRAINT mgr_emp_fk FOREIGN KEY (manager_id) REFERENCES employees_copy (employee_id)
);

DELETE FROM managers;
INSERT INTO managers values (103, 'John', 'King', 90, '123-456-789','jking');
INSERT INTO managers values (104, 'John2', 'King', 90, '123-456-780','jking2');
INSERT INTO managers values (105, 'John3', 'King', 90, '123-456-781','jking3');

SELECT * FROM employees_copy;
SELECT * FROM managers;

CREATE TABLE managers
    (manager_id    NUMBER,
     first_name    VARCHAR2(50),
     last_name     VARCHAR2(50),
     department_id NUMBER NOT NULL,
     phone_number  VARCHAR2(11) UNIQUE NOT NULL,
     email VARCHAR2(100),
     UNIQUE (email),
     CONSTRAINT mgr_emp_fk FOREIGN KEY (manager_id) REFERENCES employees_copy (employee_id) ON DELETE SET NULL
);

DELETE FROM employees_copy 
WHERE employee_id = 103; 

DELETE FROM employees_copy 
WHERE employee_id = 150;

CREATE TABLE managers
    (manager_id    NUMBER,
     first_name    VARCHAR2(50),
     last_name     VARCHAR2(50),
     department_id NUMBER NOT NULL,
     phone_number  VARCHAR2(11) UNIQUE NOT NULL,
     email         VARCHAR2(100),
     UNIQUE (email),
     CONSTRAINT mgr_emp_fk FOREIGN KEY (manager_id) REFERENCES employees_copy (employee_id) ON DELETE CASCADE
);

DELETE FROM employees_copy 
WHERE employee_id = 104;

UPDATE employees_copy 
SET employee_id = 300 
WHERE employee_id = 105;