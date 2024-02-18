/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : Pivoting Insert                                *
 ************************************************************/

CREATE TABLE emp_sales (employee_id     NUMBER(6),
                        week_id         NUMBER(2),
                        sales_mon       NUMBER,
                        sales_tue       NUMBER,
                        sales_wed       NUMBER,
                        sales_thu       NUMBER,
                        sales_fri       NUMBER);

CREATE TABLE emp_sales_normalized (employee_id     NUMBER(6),
                                   week_id         NUMBER(2),
                                   sales           NUMBER,
                                   day             VARCHAR2(3));

INSERT ALL
    INTO emp_sales VALUES (105,23,2500,3200,4700,5600,2900)
    INTO emp_sales VALUES (106,24,2740,3060,4920,5650,2800)
SELECT * FROM dual;
                                
SELECT * FROM emp_sales;
SELECT * FROM emp_sales_normalized;

INSERT ALL
    INTO emp_sales_normalized VALUES (employee_id, week_id, sales_mon, 'MON')
    INTO emp_sales_normalized VALUES (employee_id, week_id, sales_tue, 'TUE')
    INTO emp_sales_normalized VALUES (employee_id, week_id, sales_wed, 'WED')
    INTO emp_sales_normalized VALUES (employee_id, week_id, sales_thu, 'THU')
    INTO emp_sales_normalized VALUES (employee_id, week_id, sales_fri, 'FRI')
SELECT * FROM emp_sales;