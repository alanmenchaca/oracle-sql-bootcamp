-- DATA DICTIONARY VIEWS
-- Dictionary View
SELECT * FROM dictionary; -- SELECT * FROM dict; 
SELECT * FROM dictionary WHERE table_name = 'USER_CONSTRAINTS';
SELECT * FROM dictionary WHERE table_name = 'USER_TABLES';
SELECT * FROM dictionary where UPPER(table_name) LIKE '%SECURITY%';


-- USER_OBJECTS, ALL_OBJECTS, DBA_OBJECTS Views
SELECT * FROM USER_OBJECTS;
SELECT * FROM USER_CATALOG;

SELECT * FROM ALL_OBJECTS;
SELECT * FROM DBA_OBJECTS;


-- USER_TABLES View
SELECT * FROM USER_TABLES;
SELECT * FROM TABS;

-- USER_TAB_COLUMNS View
SELECT column_name, data_type, data_length, nullable, data_default,
       num_nulls, avg_col_len, num_distinct
FROM user_tab_columns -- cols
WHERE table_name = 'EMPLOYEES';

SELECT * FROM user_tab_columns WHERE table_name = 'DEPARTMENTS';


-- USER_CONSTRAINTS View
SELECT owner, table_name, constraint_name, constraint_type, search_condition,
       r_constraint_name, delete_rule, status, index_name
FROM USER_CONSTRAINTS;

SELECT * FROM user_constraints;
SELECT * FROM all_constraints;
SELECT * FROM dba_constraints;


-- USER_CONS_COLUMNS View
SELECT * FROM user_cons_columns
WHERE table_name = 'EMPLOYEES';

SELECT b.constraint_type, a.*, b.r_constraint_name
FROM user_cons_columns a INNER JOIN user_constraints b 
    ON (a.table_name = b.table_name)
WHERE a.table_name = 'EMPLOYEES';

SELECT b.constraint_type, a.*, b.r_constraint_name
FROM user_cons_columns a INNER JOIN user_constraints b 
    ON (a.table_name = b.table_name)
ORDER BY a.table_name, a.constraint_name;

SELECT * FROM user_views;


-- USER_TAB_COMMENTS & USER_COL_COMMENTS Views
 SELECT * FROM user_tab_comments;

SELECT * FROM user_tab_comments 
WHERE UPPER(comments) LIKE '%EMPLOYEE%';

SELECT * FROM user_tab_comments 
WHERE UPPER(comments) LIKE '%SALARY%';

SELECT * FROM user_col_comments 
WHERE UPPER(comments) LIKE '%SALARY%';
