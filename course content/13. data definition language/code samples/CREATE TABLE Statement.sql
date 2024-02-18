/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : CREATE TABLE Statement                         *
 ************************************************************/

DESC employees;
CREATE TABLE my_employees(employee_id   NUMBER(3)       NOT NULL,
                          first_name    VARCHAR2(50)    DEFAULT 'No Name',
                          last_name     VARCHAR2(50),
                          hire_date     DATE DEFAULT    sysdate NOT NULL);

SELECT * FROM my_employees;

INFO my_employees;

CREATE TABLE my_employees(employee_id   NUMBER(3)       NOT NULL,
                          first_name    VARCHAR2(50)    DEFAULT 'No Name',
                          last_name     VARCHAR2(50),
                          hire_date     DATE DEFAULT    sysdate NOT NULL,
                          email VARCHAR2(20));
