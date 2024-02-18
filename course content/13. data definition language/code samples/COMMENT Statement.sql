/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : COMMENT Statement                              *
 ************************************************************/

CREATE TABLE employees_copy AS SELECT * FROM employees; 

COMMENT ON COLUMN employees_copy.job_id IS 'Stores job title abbreviations';

COMMENT ON TABLE employees_copy IS 'This is a copy of the employees table';

COMMENT ON COLUMN employees_copy.hire_date IS 'The date when the employee started this job';

COMMENT ON COLUMN employees_copy.hire_date IS '';

COMMENT ON COLUMN employees_copy.hire_date IS ‘This is a sample comment’;

SELECT * FROM user_tab_comments;

SELECT * FROM user_tab_comments WHERE table_name = 'EMPLOYEES_COPY';

SELECT * FROM user_col_comments WHERE table_name = 'EMPLOYEES_COPY';