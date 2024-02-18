/************* The Complete Oracle SQL Bootcamp *************
 * Author  : Oracle Master Training                         *
 * Course  : The Complete Oracle SQL Bootcamp               *
 * Lecture : TO_CHAR, TO_DATE, TO_NUMBER Functions (Part 2)	*
 ************************************************************/

SELECT salary*commission_pct*100 "Original", 
       TO_CHAR(salary*commission_pct*100, '$999,999.00') "Formatted Version"
FROM employees WHERE commission_pct IS NOT NULL;

SELECT salary*commission_pct*100 "Original", 
       TO_CHAR(salary*commission_pct*100, 'L999,999.00') "Formatted Version"
FROM employees WHERE commission_pct IS NOT NULL;

SELECT salary*commission_pct*100 "Original", 
       TO_CHAR(salary*commission_pct*100, '$099,999.00') "Formatted Version"
FROM employees WHERE commission_pct IS NOT NULL;

SELECT salary*commission_pct*100 "Original", 
       TO_CHAR(salary*commission_pct*100, '$009,999.00') "Formatted Version"
FROM employees WHERE commission_pct IS NOT NULL;

SELECT to_number('$5,322.33', '$99,999.00') formatted_number FROM dual;