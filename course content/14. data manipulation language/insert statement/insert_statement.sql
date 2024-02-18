-- DATA MANIPULATION LANGUAGE (DML)
-- INSERT Statement
CREATE TABLE jobs_copy AS SELECT * FROM jobs;
INSERT INTO jobs_copy(job_id, job_title, min_salary, max_salary)
    VALUES('GR_LDR', 'Group Leader', 8500, 20000);

INSERT INTO jobs_copy(job_id, job_title, min_salary, max_salary)
    VALUES('PR_MGR', 'Project Manager', 7000, 18000);

-- We can insert a value into the job_copy table, specifying the
-- columns in different order.
INSERT INTO jobs_copy(job_title, min_salary, job_id, max_salary)
    VALUES('Architect', 6500, 'ARCH', 18000);

-- We can insert a new row without specifying column names.
INSERT INTO jobs_copy VALUES('DATA_ENG', 'Data Engineer', 8500, 21000);
 
-- Unspecified columns will be filled with NULL values or DEFAULT
-- values if they have any.
ALTER TABLE jobs_copy MODIFY max_salary DEFAULT 10000;
INSERT INTO jobs_copy(job_id, job_title, min_salary)
    VALUES('DATA_ARCH', 'Data Architecture', 8000);

-- We have to write something for the not null columns if they don't
-- have default values defined.
INSERT INTO jobs_copy(job_id, min_salary) VALUES('DATA_ARCH2', 8000);

-- We can add a new row without specifying column names and without
-- writing the full set of values.
INSERT INTO jobs_copy VALUES('DATA_ARCH2', 'Data Architecture2', 8000, null);

-- We can create column values using single-row functions.
INSERT INTO jobs_copy 
    VALUES('DATA_ARCH3', UPPER('Data Architecture3'), 8000, null);


-- INSERT INTO SELECT Statement
-- DROP TABLE employees_copy;
CREATE TABLE employees_copy AS SELECT * FROM employees WHERE 1=2;
INSERT INTO employees_copy SELECT * FROM employees;

-- We can copy specific rows from a table into another table.
INSERT INTO employees_copy SELECT * FROM employees WHERE job_id = 'IT_PROG';

INSERT INTO employees_copy(first_name, last_name, email, hire_date, job_id) 
SELECT first_name, last_name, email, hire_date, job_id 
    FROM employees WHERE job_id = 'IT_PROG';

-- We can use insert new rows by using multiple tables.
CREATE TABLE employee_addresses AS
    SELECT e.first_name, e.last_name, e.email,
           l.city || ' - ' || l.street_address AS address
    FROM employees e
    INNER JOIN departments d USING (department_id)
    INNER JOIN locations l USING (location_id)
WHERE 1=2;

INSERT INTO employee_addresses
    SELECT e.first_name, e.last_name, e.email,
           l.city || ' - ' || l.street_address AS address
    FROM employees e
    INNER JOIN departments d USING (department_id)
    INNER JOIN locations l USING (location_id);

SELECT * FROM employee_addresses;


-- UNCONDITIONAL INSERT ALL Statement
-- Creates the employees_history table with no data based on
-- employees table.
CREATE TABLE employees_history AS
    SELECT employee_id, first_name, last_name, hire_date
    FROM employees WHERE 1=2;

-- Creates the salary_history table with no data based on the
-- employees table, 1234 and 12 are just ordinary numbers, to
-- make the data type of these columns number.
CREATE TABLE salary_history AS
    SELECT employee_id, 1234 AS year, 12 AS month, salary, commission_pct
    FROM employees WHERE 1=2;

INSERT ALL
    INTO employees_history(employee_id, first_name, last_name, hire_date)
        VALUES(employee_id, first_name, last_name, hire_date)
    INTO salary_history(employee_id, year, month, salary, commission_pct)
        VALUES(employee_id,
               EXTRACT(year FROM sysdate),
               EXTRACT(month FROM sysdate),
               salary, commission_pct)
SELECT * FROM employees WHERE hire_date > TO_DATE('15-MAR-08');

INSERT ALL
    INTO employees_history VALUES(105, 'Adam', 'Smith', sysdate)
    INTO employees_history VALUES(106, 'Paul', 'Smith', (sysdate + 1))
SELECT * FROM dual;


-- CONDITIONAL INSERT ALL Statement
-- Creates a table called it_programmers with no data based on
-- the employees table columns.
CREATE TABLE it_programmers AS 
    SELECT employee_id, first_name, last_name, hire_date 
    FROM employees WHERE 1=2;

-- Creates a table called working_in_the_us with no data based
-- on the employees table columns.
CREATE TABLE working_in_the_us AS 
    SELECT employee_id, first_name, last_name, hire_date 
    FROM employees WHERE 1=2;

INSERT ALL
    WHEN hire_date > TO_DATE('15-MAR-08') THEN
        INTO employees_history(employee_id, first_name, last_name, hire_date)
            VALUES(employee_id, first_name, last_name, hire_date)
        INTO salary_history(employee_id, year, month, salary, commission_pct)
            VALUES(employee_id,
                   EXTRACT(year FROM sysdate),
                   EXTRACT(month FROM sysdate),
                   salary, commission_pct)
    WHEN job_id = 'IT_PROG' THEN
        INTO it_programmers 
            VALUES(employee_id, first_name, last_name, hire_date)
    WHEN department_id IN
        (SELECT department_id FROM departments WHERE location_id IN 
            (SELECT location_id FROM locations WHERE country_id = 'US')) THEN
        INTO working_in_the_us 
            VALUES(employee_id, first_name, last_name, job_id, department_id)
SELECT * FROM employees;


-- Conditional INSERT FIRST Statements
-- Tables with defined schema creation:
CREATE TABLE low_salaries AS
    SELECT employee_id, department_id, salary 
    FROM employees WHERE 1=2;

CREATE TABLE avg_salaries AS
    SELECT employee_id, department_id, salary 
    FROM employees WHERE 1=2;
    
CREATE TABLE high_salaries AS
    SELECT employee_id, department_id, salary 
    FROM employees WHERE 1=2;    

INSERT FIRST -- INSERT FIRST statement
    WHEN salary < 5000 THEN
        INTO low_salaries VALUES(employee_id, department_id, salary)
    WHEN salary BETWEEN 5000 AND 10000 THEN
        INTO avg_salaries VALUES(employee_id, department_id, salary)
    ELSE
        INTO high_salaries VALUES(employee_id, department_id, salary)
SELECT * FROM employees;

-- Pivoting INSERT
CREATE TABLE emp_sales (employee_id     NUMBER(6),
                        week_id         NUMBER(2),
                        sales_mon       NUMBER,
                        sales_tue       NUMBER,
                        sales_wed       NUMBER,
                        sales_thu       NUMBER,
                        sales_fri       NUMBER);
                        
CREATE TABLE emp_sales_normalized (employee_id      NUMBER(6),
                                   week_id          NUMBER(6),
                                   sales            NUMBER,
                                   day              VARCHAR2(3));
                                   
INSERT ALL
    INTO emp_sales VALUES (105, 23, 2500, 3200, 4700, 5600, 2900)
    INTO emp_sales VALUES (106, 24, 2740, 3060, 4920, 5650, 2800)
SELECT * FROM dual;

-- The order of execution is not guaranteed in the INSERT ALL statements!
INSERT ALL
    INTO emp_sales_normalized VALUES(employee_id, week_id, sales_mon, 'MON')
    INTO emp_sales_normalized VALUES(employee_id, week_id, sales_tue, 'TUE')
    INTO emp_sales_normalized VALUES(employee_id, week_id, sales_wed, 'WED')
    INTO emp_sales_normalized VALUES(employee_id, week_id, sales_thu, 'THU')
    INTO emp_sales_normalized VALUES(employee_id, week_id, sales_fri, 'FRI')
SELECT * FROM emp_sales;

SELECT * FROM emp_sales_normalized;
