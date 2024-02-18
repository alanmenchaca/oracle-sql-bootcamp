/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : How to Create Indexes While Table Creation     *
 ************************************************************/

CREATE TABLE sales (sale_id NUMBER PRIMARY KEY,
                    sale_date DATE NOT NULL,
                    customer_id NUMBER NOT NULL,
                    transaction_id NUMBER UNIQUE,
                    sale_detail_text VARCHAR2(4000));
                    
SELECT * FROM sales WHERE sale_id = 201 AND transaction_id = 30123;

DROP TABLE sales;
CREATE TABLE sales (sale_id NUMBER PRIMARY KEY USING INDEX (CREATE INDEX sales_sale_id_idx ON sales(sale_id)),
                    sale_date DATE NOT NULL,
                    customer_id NUMBER NOT NULL,
                    transaction_id NUMBER UNIQUE USING INDEX (CREATE INDEX sale_tran_id_idx ON sales(transaction_id)),
                    sale_detail_text VARCHAR2(4000));

DROP TABLE sales;
CREATE TABLE sales (sale_id NUMBER PRIMARY KEY USING INDEX (CREATE UNIQUE INDEX sales_sale_id_idx ON sales(sale_id)),
                    sale_date DATE NOT NULL,
                    customer_id NUMBER NOT NULL,
                    transaction_id NUMBER UNIQUE USING INDEX (CREATE BITMAP INDEX sale_tran_id_idx ON sales(transaction_id)),
                    sale_detail_text VARCHAR2(4000));

DROP TABLE sales;
CREATE TABLE sales (sale_id NUMBER PRIMARY KEY USING INDEX (CREATE UNIQUE INDEX sales_sale_id_idx ON sales(sale_id)),
                    sale_date DATE NOT NULL,
                    customer_id NUMBER NOT NULL,
                    transaction_id NUMBER USING INDEX (CREATE BITMAP INDEX sale_tran_id_idx ON sales(transaction_id)),
                    sale_detail_text VARCHAR2(4000));

DROP TABLE sales;
CREATE TABLE sales (sale_id NUMBER PRIMARY KEY USING INDEX (CREATE UNIQUE INDEX sales_sale_id_idx ON sales(sale_id)),
                    sale_date DATE NOT NULL,
                    customer_id NUMBER NOT NULL,
                    transaction_id NUMBER USING INDEX (CREATE UNIQUE INDEX sale_tran_id_idx ON sales(transaction_id)),
                    sale_detail_text VARCHAR2(4000));

DROP TABLE sales;
CREATE TABLE sales (sale_id NUMBER PRIMARY KEY USING INDEX (CREATE UNIQUE INDEX sales_sale_id_idx ON sales(sale_id)),
                    sale_date DATE NOT NULL,
                    customer_id NUMBER NOT NULL,
                    transaction_id NUMBER UNIQUE USING INDEX (CREATE UNIQUE INDEX sale_tran_id_idx ON sales(transaction_id)),
                    sale_detail_text VARCHAR2(4000));

CREATE TABLE sales2 (sale_id NUMBER PRIMARY KEY USING INDEX sales_sale_id_idx,
                    sale_date DATE NOT NULL,
                    customer_id NUMBER NOT NULL,
                    transaction_id NUMBER UNIQUE,
                    sale_detail_text VARCHAR2(4000));

DROP TABLE sales;
CREATE TABLE sales (sale_id NUMBER,
                    sale_date DATE NOT NULL,
                    customer_id NUMBER NOT NULL,
                    transaction_id NUMBER,
                    sale_detail_text VARCHAR2(4000));
ALTER TABLE sales ADD PRIMARY KEY (sale_id) USING INDEX (CREATE UNIQUE INDEX sales_sale_id_idx ON sales(sale_id));

CREATE UNIQUE INDEX sale_tran_id_idx ON sales(transaction_id);
ALTER TABLE sales ADD UNIQUE (transaction_id) USING INDEX sale_tran_id_idx;
