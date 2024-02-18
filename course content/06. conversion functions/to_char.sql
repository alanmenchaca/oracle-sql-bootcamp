-- TO_CHAR Function
SELECT first_name, last_name, TO_CHAR(hire_date, 'YYYY')
    FROM employees WHERE TO_CHAR(employee_id) = '100';

/* --- DATE Format Models --- */
-- Year Format Models
SELECT first_name, hire_date, -- Steven	17-JUN-03	2003
    TO_CHAR(hire_date, 'YYYY') AS "Formatted Date" FROM employees;
    
SELECT first_name, hire_date, -- Steven	17-JUN-03	03
    TO_CHAR(hire_date, 'RR') AS "Formatted Date" FROM employees;

SELECT first_name, hire_date, -- Steven	17-JUN-03	TWO THOUSAND THREE
    TO_CHAR(hire_date, 'YEAR') AS "Formatted Date" FROM employees;

-- Month Format Models
SELECT first_name, hire_date, -- Steven	17-JUN-03	06
    TO_CHAR(hire_date, 'MM') AS "Formatted Date" FROM employees;

SELECT first_name, hire_date, -- Steven	17-JUN-03	06-2003
    TO_CHAR(hire_date, 'MM-YYYY') AS "Formatted Date" FROM employees;   

SELECT first_name, hire_date, -- Steven	17-JUN-03	jun-2003
    TO_CHAR(hire_date, 'mon-yyyy') AS "Formatted Date" FROM employees;

SELECT first_name, hire_date, -- Steven	17-JUN-03	June     -2003
    TO_CHAR(hire_date, 'Month-yyyy') AS "Formatted Date" FROM employees;

-- Day Format Models
SELECT first_name, hire_date, -- Steven	17-JUN-03	17-2003
    TO_CHAR(hire_date, 'dd-yyyy') AS "Formatted Date" FROM employees;

SELECT first_name, hire_date, -- Steven	17-JUN-03	TUE-2003
    TO_CHAR(hire_date, 'DY-yyyy') AS "Formatted Date" FROM employees;

SELECT first_name, hire_date, -- Steven	17-JUN-03	Tuesday  -2003
    TO_CHAR(hire_date, 'Day-yyyy') AS "Formatted Date" FROM employees;
    
-- Hour Format Models
SELECT first_name, hire_date, -- Steven	17-JUN-03	Tuesday  -June     -2003 12
    TO_CHAR(hire_date, 'Day-Month-yyyy HH12') AS "Formatted Date" FROM employees;
    
SELECT first_name, hire_date, -- Steven	17-JUN-03	Tuesday  -June     -2003 00
    TO_CHAR(hire_date, 'Day-Month-yyyy HH24') AS "Formatted Date" FROM employees;

SELECT first_name, hire_date, -- Steven	17-JUN-03	Tuesday  -June     -2003 00:00
    TO_CHAR(hire_date, 'Day-Month-yyyy HH24:MI') AS "Formatted Date" FROM employees;

SELECT first_name, hire_date, -- Steven	17-JUN-03	Tuesday  -June     -2003 00:00:00
    TO_CHAR(hire_date, 'Day-Month-yyyy HH24:MI:SS') AS "Formatted Date" FROM employees;

SELECT first_name, hire_date, -- Steven	17-JUN-03	Friday   -November -2023 01:01:54
    TO_CHAR(sysdate, 'Day-Month-yyyy HH24:MI:SS') AS "Formatted Date" FROM employees;

----------------------------------------------------------------------

SELECT first_name, hire_date, -- Steven	17-JUN-03	03RD-November -2023 01:05:38
    TO_CHAR(sysdate, 'DDTH-Month-yyyy HH24:MI:SS') AS "Formatted Date" FROM employees;

SELECT first_name, hire_date, -- Steven	17-JUN-03	03RD-11TH-2023 01:07:00
    TO_CHAR(sysdate, 'DDTH-MMTH-yyyy HH24:MI:SS') AS "Formatted Date" FROM employees;

SELECT first_name, hire_date, -- Steven	17-JUN-03	THREE-11TH-2023 01:07:39
    TO_CHAR(sysdate, 'DDSP-MMTH-yyyy HH24:MI:SS') AS "Formatted Date" FROM employees;
    
SELECT first_name, hire_date, -- Steven	17-JUN-03	THIRD-11TH-2023 01:08:02
    TO_CHAR(sysdate, 'DDSPTH-MMTH-yyyy HH24:MI:SS') AS "Formatted Date" FROM employees;
 