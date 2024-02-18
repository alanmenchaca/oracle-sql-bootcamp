-- ORDER BY clause
SELECT first_name, last_name, salary, 
    (10 * (salary / 5) + 3000) - 100 AS "NEW_SALARY"
    FROM employees ORDER BY NEW_SALARY;
-- ORDER BY [column_position]
-- It's not recommended to sort column this way because it's
-- hard to remember what number correspond to what column in
-- the table.
SELECT first_name, last_name, salary, 
    (10 * (salary / 5) + 3000) - 100 AS "NEW_SALARY"
    FROM employees ORDER BY 1;
SELECT * FROM employees ORDER BY 2;
SELECT * FROM employees ORDER BY first_name, last_name;

-- ASC and DESC Operators
SELECT employee_id, first_name, last_name, salary 
    FROM employees ORDER BY first_name ASC;
SELECT employee_id, first_name, last_name, salary 
    FROM employees ORDER BY first_name DESC, last_name DESC;

SELECT employee_id, first_name, last_name, salary AS s 
    FROM employees ORDER BY 2 DESC, s DESC;
    
-- NULL values are displayed last in the ascending order.
SELECT first_name, salary, commission_pct 
    FROM employees ORDER BY commission_pct;

-- NULLS FIRST and NULLS LAST Operators
SELECT first_name, last_name, commission_pct c FROM employees 
    ORDER BY 1 DESC NULLS LAST, last_name ASC, c NULLS FIRST;
    
-- ROWID & ROWNUM
SELECT employee_id, first_name, last_name, salary, rowid, rownum
FROM employees WHERE department_id = 80 AND ROWNUM <= 10;

-- ROWNUM QUERY WITH SUBQUERY
SELECT employee_id, first_name, last_name, salary, rowid, rownum
    FROM (SELECT employee_id, first_name, last_name, salary, rowid
            FROM employees WHERE department_id = 80 ORDER BY salary DESC)
    WHERE ROWNUM <= 5;

------------------------------------------------------------------

-- FETCH Clause
/* The WITH TIES returns extra rows with the same value as the
   last row fetched. */
SELECT first_name, last_name, salary FROM employees
    ORDER BY salary DESC 
    OFFSET 1 ROW FETCH FIRST 10 ROWS WITH TIES;

/* If we specified WITH TIES, then we must
   specify the order_by_clause. If we do not specify the ORDER BY
   clause, then, no additional rows will be returned. */
SELECT first_name, last_name, salary FROM employees
    OFFSET 1 ROW FETCH FIRST 10 ROWS WITH TIES;

SELECT first_name, last_name, salary FROM employees
    OFFSET 10 ROWS;
SELECT first_name, last_name, salary FROM employees
    ORDER BY salary DESC FETCH FIRST 5 ROWS ONLY;
