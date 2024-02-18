-- ALTER TABLE "ADD" Statement
CREATE TABLE employees_copy (
    first_name  VARCHAR2(50),
    hire_date   DATE DEFAULT sysdate NOT NULL,
    phone       VARCHAR2(20)
);

-- Adding a table to a column
ALTER TABLE employees_copy ADD ssn VARCHAR2(11);

-- Adding multiple columns to a table
ALTER TABLE employees_copy
ADD (fax_number     VARCHAR2(11),
     birth_date     DATE,
     password       VARCHAR2(10) DEFAULT 'abc_123@');

DESC employees_copy;


-- ALTER TABLE "MODIFY" Statement
-- We can modify a single column of a table.
ALTER TABLE employees_copy MODIFY password VARCHAR2(50);

-- We can modify multiple columns of a table at the same time.
ALTER TABLE employees_copy
MODIFY (fax_number VARCHAR2(11) DEFAULT '--',
        password   VARCHAR2(10) NOT NULL);
        
INFO employees_copy;


-- ALTER TABLE "DROP" Statement
-- We can drop a single column of a table.
ALTER TABLE employees_copy DROP COLUMN ssn;

-- We can drop multiple columns of a table at the same time.
ALTER TABLE employees_copy DROP (fax_number, password);
ALTER TABLE employees_copy DROP (birth_date);

INFO employees_copy;


-- ALTER TABLE "SET UNUSED" Option
CREATE TABLE employees_copy AS SELECT * FROM employees;
ALTER TABLE employees_copy SET UNUSED (first_name, phone_number, salary);
ALTER TABLE employees_copy SET UNUSED COLUMN last_name ONLINE;

-- We can see the number of unused columns of each table by
-- querying the table user_unused_col_tabs.
SELECT * FROM user_unused_col_tabs;

-- Drop unused columns
ALTER TABLE employees_copy DROP UNUSED COLUMNS;
SELECT * FROM user_unused_col_tabs;

DESC employees_copy;


-- READ ONLY Tables
CREATE TABLE emp_temp AS SELECT * FROM employees;
ALTER TABLE emp_temp READ ONLY;

DELETE emp_temp;
ALTER TABLE emp_temp ADD gender VARCHAR(1);
ALTER TABLE emp_temp DROP (gender);
DROP TABLE emp_temp;

ALTER TABLE emp_temp READ WRITE;


-- RENAME Statement
-- We can change the name of a column.
CREATE TABLE employees_copy AS SELECT * FROM employees;
ALTER TABLE employees_copy RENAME COLUMN hire_date TO start_date;
DESC employees_copy;

-- We can change the name of a table.
RENAME employees_copy TO employees_backup;
ALTER TABLE employees_copy RENAME TO employees_backup;
