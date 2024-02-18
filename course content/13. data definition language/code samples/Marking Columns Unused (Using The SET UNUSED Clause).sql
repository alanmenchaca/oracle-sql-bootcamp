/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : Marking Columns Unused (SET UNUSED Clause)     *
 ************************************************************/

SELECT * FROM employees_copy;

ALTER TABLE employees_copy SET UNUSED (first_name, phone_number, salary);

DESC employees_copy;

SELECT * FROM USER_UNUSED_COL_TABS;

ALTER TABLE employees_copy SET UNUSED COLUMN last_name ONLINE;

ALTER TABLE employees_copy DROP UNUSED COLUMNS;