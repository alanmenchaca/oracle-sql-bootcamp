-- WORKING WITH ORACLE INDEXES IN SQL
-- How to Create Indexes
DROP TABLE employees_copy;
-- While creating a table using a CTAS statement
-- indexes will not be copied!
CREATE TABLE employees_copy AS SELECT * FROM employees;
-- The bigger our table is, the better we will benefit from the indexes.
CREATE UNIQUE INDEX emp_cpy_eid_idx ON employees_copy(employee_id);
SELECT * FROM employees_copy WHERE employee_id = 103;

CREATE INDEX emp_cpy_lname_idx ON employees_copy(last_name);
CREATE INDEX emp_cpy_name_idx ON employees_copy(first_name, last_name);
-- Bitmap Indexes should be used if column values are not selective.
-- The UNIQUE keyword cannot be used with BITMAP indexes.
CREATE BITMAP INDEX emp_cpy_comm_idx ON employees_copy(commission_pct);

-- The indexes are used only if we use the index column in the 
-- where clause and it queries for a small portion of the table.
SELECT * FROM employees_copy WHERE last_name = 'King';
SELECT * FROM employees_copy 
WHERE last_name = 'King' AND first_name = 'Steven';
SELECT * FROM employees_copy WHERE commission_pct = 0.4;


-- How to Create Indexes While Table Creation?
CREATE TABLE sales (
    sale_id          NUMBER PRIMARY KEY,
    sale_date        DATE NOT NULL,
    customer_id      NUMBER NOT NULL,
    transaction_id   NUMBER UNIQUE,
    sale_detail_text VARCHAR2(4000)
);

SELECT * FROM sales WHERE sale_id = 201 AND transaction_id = 30123;

DROP TABLE sales;
CREATE TABLE sales (
    sale_id          NUMBER PRIMARY KEY USING INDEX
        (CREATE INDEX sales_sale_id_idx ON sales(sale_id)),
    sale_date        DATE NOT NULL,
    customer_id      NUMBER NOT NULL,
    transaction_id   NUMBER UNIQUE USING INDEX 
        (CREATE INDEX sales_tran_id_idx ON sales(transaction_id)),
    sale_detail_text VARCHAR2(4000)
);

DROP TABLE sales;
CREATE TABLE sales (
    sale_id          NUMBER PRIMARY KEY USING INDEX
        (CREATE UNIQUE INDEX sales_sale_id_idx ON sales(sale_id)),
    sale_date        DATE NOT NULL,
    customer_id      NUMBER NOT NULL,
    transaction_id   NUMBER UNIQUE USING INDEX 
        (CREATE UNIQUE INDEX sales_tran_id_idx ON sales(transaction_id)),
    sale_detail_text VARCHAR2(4000)
);

CREATE TABLE sales (
    sale_id          NUMBER PRIMARY KEY USING INDEX sales_sale_id_idx,
    sale_date        DATE NOT NULL,
    customer_id      NUMBER NOT NULL,
    transaction_id   NUMBER UNIQUE,
    sale_detail_text VARCHAR2(4000)
);

DROP TABLE sales;
CREATE TABLE sales (
    sale_id          NUMBER,
    sale_date        DATE NOT NULL,
    customer_id      NUMBER NOT NULL,
    transaction_id   NUMBER,
    sale_detail_text VARCHAR2(4000)
);

ALTER TABLE sales ADD PRIMARY KEY (sale_id) USING INDEX
    (CREATE UNIQUE INDEX sales_sale_id_idx ON sales(sale_id));

CREATE UNIQUE INDEX sales_tran_id_idx ON sales(transaction_id);

ALTER TABLE sales ADD UNIQUE (transaction_id) USING INDEX sales_tran_id_idx;


-- Dropping Indexes
DROP INDEX  emp_cpy_comm_idx;


-- Function-Based Indexes
DROP TABLE employees_copy;
CREATE TABLE employees_copy AS SELECT * FROM employees;
CREATE INDEX emp_cpy_lname_idx ON employees_copy(UPPER(last_name));
SELECT * FROM employees_copy WHERE UPPER(last_name) = 'KING';
SELECT * FROM employees_copy WHERE LOWER(last_name) = 'KING';
SELECT * FROM employees_copy WHERE last_name = 'KING';
DROP INDEX emp_cpy_lname_idx;


-- Multiple Indexes on the Same Columns
DROP TABLE employees_copy;
CREATE TABLE employees_copy AS SELECT * FROM employees;
CREATE INDEX emp_cpy_dpt_id_idx ON employees_copy(department_id);
CREATE INDEX emp_cpy_dpt_id_idx2 ON employees_copy(department_id) INVISIBLE;
CREATE BITMAP INDEX emp_cpy_dpt_id_idx2 ON employees_copy(department_id);
CREATE BITMAP INDEX emp_cpy_dpt_id_idx2 ON employees_copy(department_id) INVISIBLE;

SELECT * FROM employees_copy WHERE department_id = 20;
SELECT /*+ USE_INVISIBLE_INDEXES INDEX (employees_copy emp_cpy_dpt_id_idx2) */ *
    FROM employees_copy WHERE department_id = 20;

DROP INDEX emp_cpy_dpt_id_idx2;
ALTER INDEX emp_cpy_dpt_id_idx INVISIBLE;

CREATE UNIQUE INDEX emp_cpy_empid_idx ON employees_copy(employee_id) INVISIBLE;
SELECT * FROM employees_copy WHERE employee_id = 102;
SELECT /*+ USE_INVISIBLE_INDEXES INDEX (employees_copy emp_cpy_empid_idx) */ *
    FROM employees_copy WHERE employee_id = 103;
ALTER SESSION SET optimizer_use_invisible_indexes = TRUE;


-- Analyzing the USER_INDEXES and USER_IND_COLUMNS Views
SELECT * FROM user_indexes;
SELECT * FROM user_ind_columns WHERE table_name = 'EMPLOYEES';
SELECT * FROM employees WHERE first_name = 'Steven';
SELECT * FROM employees WHERE last_name = 'King';
SELECT * FROM employees WHERE last_name = 'King' AND first_name = 'Steven';


-- Altering Indexes
DROP TABLE employees_copy;
CREATE TABLE employees_copy AS SELECT * FROM employees;
ALTER TABLE employees_copy ADD PRIMARY KEY (employee_id);
SELECT * FROM user_indexes WHERE table_name = 'EMPLOYEES_COPY';
ALTER INDEX SYS_C008584 RENAME TO emp_cpy_eid_idx;
SELECT * FROM employees_copy WHERE employee_id = 104;
ALTER INDEX emp_cpy_eid_idx UNUSABLE;
SELECT index_name, status FROM user_indexes WHERE table_name = 'EMPLOYEES_COPY';
ALTER INDEX emp_cpy_eid_idx COMPILE;
-- We must rebuild an unusable index to make that index usable again.
ALTER INDEX emp_cpy_eid_idx REBUILD;
-- We can only ENABLE or DISABLE function-based indexes.
ALTER INDEX emp_cpy_eid_idx DISABLE;

CREATE INDEX emp_cpy_name_idx -- composite, function-based index
    ON employees_copy(UPPER(last_name), first_name);
SELECT index_name, index_type, status, funcidx_status
FROM user_indexes WHERE table_name = 'EMPLOYEES_COPY';
SELECT * FROM employees_copy WHERE UPPER(last_name) = 'STEVEN';
-- NOTE: Disabling function-based indexes is not recommended!
ALTER INDEX emp_cpy_name_idx DISABLE;
ALTER INDEX emp_cpy_name_idx ENABLE;
ALTER INDEX emp_cpy_name_idx INVISIBLE;
SELECT index_name, index_type, status, funcidx_status, visibility
FROM user_indexes WHERE table_name = 'EMPLOYEES_COPY';
ALTER INDEX emp_cpy_name_idx VISIBLE;
