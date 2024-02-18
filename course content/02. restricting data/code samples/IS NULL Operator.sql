/************* The Complete Oracle SQL Bootcamp ****************
 * Author  : Oracle Master Training                            *
 * Course  : The Complete Oracle SQL Bootcamp                  *
 * Lecture : IS NULL Operator                                  *
 ***************************************************************/

SELECT * FROM employees WHERE commission_pct = NULL;
SELECT * FROM employees WHERE commission_pct IS NULL;
SELECT * FROM employees WHERE commission_pct IS NOT NULL;
