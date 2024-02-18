-- Dates in SQL Oracle
SELECT sysdate FROM dual;
SELECT CURRENT_DATE, SESSIONTIMEZONE, SYSTIMESTAMP, CURRENT_TIMESTAMP
    FROM DUAL;
 -- CURRENT_DATE:      01-NOV-23
-- SESSIONTIMEZONE:   America/Mexico_City
-- SYSTIMESTAMP:      01-NOV-23 01.24.23.980000000 PM -06:00
-- CURRENT_TIMESTAMP: 01-NOV-23 01.24.23.980000000 PM AMERICA/MEXICO_CITY

-- Arithmetic Operations with Dates
SELECT (sysdate + 4) FROM dual; -- adds 4 days to sysdate
SELECT (sysdate + 1 / 24) FROM dual; -- adds 1 hour to sysdate
SELECT (sysdate + 1 / (24 * 60)) FROM dual; -- adds 1 minute to sysdate

SELECT employee_id, hire_date, sysdate,
    TRUNC(sysdate - hire_date) AS worked_in_days FROM employees;

SELECT first_name, last_name, TRUNC((sysdate - hire_date) / 365)
    AS worked_in_years FROM employees
    ORDER BY worked_in_years;

-- Date Manipulation Functions 
SELECT ADD_MONTHS('18-SEP-23', 3) FROM dual; -- 18-DEC-23
SELECT ADD_MONTHS('18/SEP/23', -2) FROM dual; -- 18-DEC-23

SELECT MONTHS_BETWEEN('03-SEP-20', '18-FEB-20') FROM dual; -- 6.516...
SELECT ROUND(sysdate, 'MONTH') FROM dual; -- 01-NOV-23
SELECT TRUNC(sysdate, 'YEAR') FROM dual; -- 01-JAN-23
SELECT EXTRACT(month FROM sysdate) FROM dual; -- 11
SELECT NEXT_DAY('04-JUN-20', 'TUESDAY') FROM dual; -- 09-JUN-20
SELECT LAST_DAY('04-JUL-20') FROM dual; -- 31-JUL-20

SELECT sysdate, ADD_MONTHS('12JUL21', 30) FROM dual;
SELECT employee_id, hire_date, 
    TRUNC(hire_date, 'YEAR') truncated_result,
    ROUND(hire_date, 'YEAR') rounded_result
FROM employees;

SELECT EXTRACT(day FROM sysdate) extracted_result FROM dual;
SELECT EXTRACT(month FROM sysdate) extracted_result FROM dual;
SELECT EXTRACT(year FROM sysdate) extracted_result FROM dual;

SELECT MOD(2017,30) FROM dual;
SELECT ROUND(45.953, -1), TRUNC(45.936, 2) FROM dual; 
