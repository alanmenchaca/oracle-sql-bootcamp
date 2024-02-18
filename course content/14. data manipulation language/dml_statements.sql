-- DATA MANIPULATION LANGUAGE (DML)
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
    SET salary = 50000, department_id = null
WHERE job_id = 'IT_PROG';


-- MERGE Statement
DELETE FROM employees_copy;
INSERT INTO employees_copy 
    SELECT * FROM employees WHERE job_id = 'SA_REP';
UPDATE employees_copy SET first_name = 'Alex';

MERGE INTO employees_copy c
USING (SELECT * FROM employees WHERE job_id = 'IT_PROG') e
ON (c.employee_id = e.employee_id)
WHEN MATCHED THEN
    UPDATE SET c.first_name    = e.first_name,
               c.last_name     = e.last_name,
               c.salary        = e.salary
    DELETE WHERE department_id IS NULL
WHEN NOT MATCHED THEN
    INSERT VALUES(e.employee_id, e.first_name, e.last_name, e.email,
                  e.phone_number, e.hire_date,  e.job_id, e.salary,
                  e.commission_pct, e.manager_id, e.department_id);

MERGE INTO employees_copy c
USING employees e
ON (c.employee_id = e.employee_id)
WHEN MATCHED THEN
    UPDATE SET c.first_name = e.first_name,
               c.last_name  = e.last_name,
               c.department_id  = e.department_id,
               c.job_id  = e.job_id,
               c.salary  = e.salary
    DELETE WHERE department_id IS NULL
WHEN NOT MATCHED THEN
    INSERT VALUES(e.employee_id, e.first_name, e.last_name, e.email,
                  e.phone_number, e.hire_date,  e.job_id, e.salary,
                  e.commission_pct, e.manager_id, e.department_id);


-- COMMIT and ROLLBACK statements
SELECT * FROM employees_copy;
DELETE employees_copy WHERE job_id = 'SA_REP';
ROLLBACK;
UPDATE employees_copy SET first_name = 'John';
COMMIT;
 
 UPDATE employees_copy c 
    SET first_name = (SELECT first_name 
                      FROM employees e
                      WHERE e.employee_id = c.employee_id);


-- SAVEPOINT Statement
CREATE TABLE employees_copy AS SELECT * FROM employees;
CREATE TABLE jobs_copy AS SELECT * FROM jobs;

-- After rollback to an earlier savepoint, the subsequent savepoints
-- will be deleted, and only the previous one will remain.
DELETE FROM employees_copy WHERE job_id = 'IT_PROG';
SAVEPOINT A;
UPDATE employees_copy SET salary = 1.2 * salary;
SAVEPOINT B;
INSERT INTO jobs_copy VALUES('PY_DEV', 'Python Developer', 12000, 20000);
SAVEPOINT C;
DELETE FROM employees_copy WHERE job_id = 'SA_REP';
SAVEPOINT D;

SELECT * FROM employees_copy;
SELECT * FROM jobs_copy;

ROLLBACK;
ROLLBACK TO SAVEPOINT B;
ROLLBACK TO SAVEPOINT A;


-- FOR UPDATE Statement
SELECT * FROM employees_copy WHERE job_id = 'IT_PROG' FOR UPDATE;

-- With joins, the rows from all the joined tables are locked by default.
SELECT first_name, last_name, salary, department_id
FROM employees_copy INNER JOIN departments d
USING(department_id)
WHERE location_id = 1400 -- Filter the rows to be locked. 
FOR UPDATE;

-- The OF clause is used to indicate which tables will be locked.
SELECT first_name, last_name, salary
FROM employees_copy INNER JOIN departments d 
USING(department_id)
WHERE location_id = 1400
FOR UPDATE OF first_name, location_id;

-- The NOWAIT keywords tells Oracle not to wait if the rows have
-- already been locked by another user.
SELECT first_name, last_name, salary
FROM employees_copy INNER JOIN departments d 
USING(department_id)
WHERE location_id = 1400
FOR UPDATE OF first_name, location_id NOWAIT;

-- The WAIT option is used to specify how many records to wait 
-- for the locked rows.
SELECT first_name, last_name, salary
FROM employees_copy INNER JOIN departments d 
USING(department_id)
WHERE location_id = 1400
FOR UPDATE OF first_name, last_name WAIT 5;

-- The SKIP LOCKED keywords tells Oracle to skip the locked rows 
-- and operate on the available ones.
SELECT first_name, last_name, salary
FROM employees_copy INNER JOIN departments d 
USING(department_id)
WHERE location_id = 1400
FOR UPDATE OF first_name, last_name SKIP LOCKED;
