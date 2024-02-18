-- temp_user has the PUBLIC role by default, so it
-- has all the privileges that the public role has.
SELECT * FROM session_privs;
SELECT * FROM user_sys_privs;
-- The user doesn't have the privilege to query.
SELECT * FROM dba_sys_privs;

CREATE TABLE temp_table (temp_column NUMBER);
DROP TABLE temp_table;


-- Granting Object Privileges
SELECT * FROM hr.employees_copy;
UPDATE hr.employees_copy SET salary = 100;
UPDATE hr.employees_copy SET manager_id = 100;
INSERT INTO hr.employees_copy (employee_id, first_name, last_name, 
                               email, hire_date, job_id, salary)
    VALUES (207, 'Alex', 'Brown', 'ABROWN', sysdate, 'IT_PROG', 5000);
CREATE INDEX idx_emp_cpy ON hr.employees_copy(email);
SELECT * FROM user_tab_privs;


-- Revoking Object Privileges
-- hr schema
ALTER TABLE employees_copy ADD PRIMARY KEY (employee_id);
GRANT ALL PRIVILEGES ON employees_copy TO temp_user;
REVOKE ALL PRIVILEGES ON employees_copy FROM temp_user;
GRANT SELECT ON SYSTEM.redo_db TO temp_user;

-- temp_user schema
CREATE TABLE temp (
    temp_column NUMBER,
    CONSTRAINT fk_temp FOREIGN KEY (temp_column) 
        REFERENCES hr.employees_copy (employee_id)
);
DROP TABLE temp;
