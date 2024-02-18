/************* The Complete Oracle SQL Bootcamp ****************
 * Author  : Oracle Master Training                            *
 * Course  : The Complete Oracle SQL Bootcamp                  *
 * Lecture : USER_CONS_COLUMNS Data Dictionary View            *
 ***************************************************************/

SELECT * FROM user_cons_columns;
SELECT * FROM user_cons_columns WHERE table_name = 'EMPLOYEES';

SELECT * FROM user_cons_columns a join user_constraints b
ON(a.table_name = b.table_name AND a.constraint_name = b.constraint_name)
WHERE a.table_name = 'EMPLOYEES';

SELECT b.constraint_type, a.* FROM user_cons_columns a join user_constraints b
ON(a.table_name = b.table_name AND a.constraint_name = b.constraint_name)
WHERE a.table_name = 'EMPLOYEES';

SELECT b.constraint_type, a.*, b.r_constraint_name FROM user_cons_columns a join user_constraints b
ON(a.table_name = b.table_name AND a.constraint_name = b.constraint_name)
WHERE a.table_name = 'EMPLOYEES';

SELECT b.constraint_type, a.*, b.r_constraint_name FROM user_cons_columns a join user_constraints b
ON(a.table_name = b.table_name AND a.constraint_name = b.constraint_name)
ORDER BY a.table_name, a.constraint_name;

SELECT * FROM all_cons_columns;
SELECT * FROM dba_cons_columns;