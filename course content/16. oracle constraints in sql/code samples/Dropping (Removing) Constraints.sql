/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : Dropping (Removing) Constraints                *
 ************************************************************/

SELECT * FROM employees_copy;
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
DROP TABLE managers;

ALTER TABLE employees_copy DROP CONSTRAINT emp_cpy_emp_id_pk;
ALTER TABLE employees_copy DROP CONSTRAINT emp_cpy_emp_id_pk CASCADE;
ALTER TABLE employees_copy DROP PRIMARY KEY CASCADE;
ALTER TABLE employees_copy DROP CONSTRAINT SYS_C008689 ONLINE;
