/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : COUNT Function 									*
 ************************************************************/

SELECT count(*),
       count(commission_pct),
       count(distinct commission_pct),
       count(distinct nvl(commission_pct,0))
FROM employees;