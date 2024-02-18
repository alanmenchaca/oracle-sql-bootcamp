-- DATA DEFINITION LANGUAGE (DDL)
-- CREATE TABLE Statement
CREATE TABLE my_employees (
    employee_id NUMBER(3)	    NOT NULL,
    first_name  VARCHAR2(50)    DEFAULT 'No Name',
    last_name	VARCHAR2(50),
    hire_date	DATE            DEFAULT sysdate NOT NULL
);

INFO my_employees;


-- CREATE TABLE AS SELECT Statement (CTAS)
-- A table can be copied with all its table structure and its data.
CREATE TABLE employees_copy AS SELECT * FROM employees;

-- A table's structure can be copied without any data.
CREATE TABLE employees_copy AS (SELECT * FROM employees WHERE 1=2);

-- A table can be created by copying some specific data from another table.
CREATE TABLE employees_copy
AS (SELECT * FROM employees WHERE job_id = 'IT_PROG');

-- A table can be created from another table, using only some of the columns.
CREATE TABLE employees_copy
AS SELECT first_name, last_name, salary FROM employees;

-- Column names can be defined differently from the SELECT list while
-- creating a table.
CREATE TABLE employees_copy
AS SELECT first_name f_name, last_name l_name, salary FROM employees;

CREATE TABLE employees_copy(name, surname, annual_salary)
AS SELECT first_name, last_name, (salary * 12) FROM employees;

-- The number of specified columns must match with the number of
-- columns in the SELECT list.
CREATE TABLE employees_copy(name, surname)
AS SELECT first_name, last_name, (salary * 12) FROM employees;
-- Invalid number of column names specified, error.


-- DROP TABLE Statement
CREATE TABLE employees_copy AS SELECT * FROM employees;
DROP TABLE employees_copy PURGE;

FLASHBACK TABLE employees_copy TO BEFORE DROP;
SELECT * FROM employees_copy;


-- TRUNCATE TABLE Statement
CREATE TABLE employees_copy AS SELECT * FROM employees;
DELETE FROM employees_copy;
TRUNCATE TABLE employees_copy;

-- performance test
CREATE TABLE employees_performance_test AS
    SELECT e1.first_name, e1.last_name, e1.department_id, e1.salary
    FROM employees e1 CROSS JOIN employees e2 CROSS JOIN employees e3;

-- The TRUNCATE statement works faster than the DELETE statement.
SELECT COUNT(*) FROM employees_performance_test;
DELETE FROM employees_performance_test;
TRUNCATE TABLE employees_performance_test;

DROP TABLE employees_performance_test;


-- COMMENT Statement
CREATE TABLE employees_copy AS SELECT * FROM employees;
-- We can add a comment to a column of a table.
COMMENT ON COLUMN employees_copy.job_id 
    IS 'Stores job title abbreviations.';

-- We can add a comment to a table itself.
COMMENT ON TABLE employees_copy
    IS 'This is a copy of the employees table.';

-- We cannot directly drop a comment, instead, we create
-- a new comment with no text.
COMMENT ON COLUMN employees_copy.job_id 
    IS 'The date when the employee started this job.';
COMMENT ON COLUMN employees_copy.job_id IS '';    

-- We can query the comments from the following views
SELECT * FROM user_tab_comments; -- user table comments
SELECT * FROM user_col_comments; -- user columns comments

SELECT * FROM user_tab_comments WHERE table_name = 'EMPLOYEES_COPY';
SELECT * FROM user_col_comments WHERE table_name = 'EMPLOYEES_COPY';


-- UPDATE Statement
DROP TABLE employees_copy;
CREATE TABLE employees_copy AS SELECT * FROM employees;

-- We can update all of the values in one column of a table in one step.
UPDATE employees_copy SET salary = 500;

-- We can update only specific rows in a column of a table using
-- the WHERE clause.
UPDATE employees_copy SET salary = 50000 WHERE job_id = 'IT_PROG';

-- We can update multiple columns of a table in an UPDATE statement.
UPDATE employees_copy
    SET salary = 9999, department_id = null
WHERE job_id = 'IT_PROG';

-- We can update one or more columns of a table using a subquery
UPDATE employees_copy
SET (salary, commission_pct) = (SELECT MAX(salary), MAX(commission_pct)
                                FROM employees)
WHERE job_id = 'IT_PROG';

-- Subqueries can also be used in the WHERE clause of an UPDATE statement.
UPDATE employees_copy
SET salary	    = 100000
WHERE hire_date = (SELECT MAX(hire_date) FROM employees);


-- DELETE Statement
-- We can delete all of the rows in a table.
DELETE FROM employees_copy;

-- We can delete specific rows of a table.
DELETE FROM employees_copy
WHERE job_id = 'IT_PROG';

-- We can delete rows based on a subquery.
DELETE employees_copy
WHERE department_id IN
        (SELECT department_id
         FROM departments
         WHERE UPPER(department_name) LIKE '%SALES%');

SELECT * FROM employees_copy;
