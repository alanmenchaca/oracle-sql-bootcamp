/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : Creating Simple Views                          *
 ************************************************************/

SELECT * FROM employees WHERE department_id = 90;

CREATE VIEW empvw90 AS
SELECT * FROM employees WHERE department_id = 90;

SELECT * FROM empvw90;
SELECT * FROM empvw90 WHERE salary < 20000;

CREATE VIEW empvw20 AS
SELECT employee_id, first_name, last_name FROM employees WHERE department_id = 20;
SELECT * FROM empvw20;
SELECT first_name, last_name FROM empvw20;

CREATE VIEW empvw30 AS
SELECT employee_id e_id, first_name name, last_name surname 
    FROM employees WHERE department_id = 30;
SELECT * FROM empvw30;

CREATE VIEW empvw40 (e_id, name, surname, email) AS
SELECT employee_id, first_name, last_name, email 
    FROM employees WHERE department_id = 40;
SELECT * FROM empvw40;

CREATE VIEW empvw41 (e_id, name, surname, email) AS
SELECT employee_id eid, first_name, last_name, email 
    FROM employees WHERE department_id = 40;
SELECT * FROM empvw41;