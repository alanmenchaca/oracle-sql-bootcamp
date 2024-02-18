-- Q1: Identify the SELECT statements that execute successfully
-- answer: (B), (C)
SELECT first_name, last_name, job_id, salary * 12 "annual sal" FROM employees;
SELECT first_name, last_name, job_id, salary AS "annual sal" FROM employees;

-- Q2: In an SQL SELECT statement, asterisk (*) means that;
-- answer: (A) all the columns of the table are returned.
    
-- Q3: How do you select all the rows from a table named "employees"
--     where the value of the column "last_name" is 'KING'?
-- answer: (B), (C)
SELECT * FROM employees WHERE last_name = 'KING';
SELECT * FROM employees WHERE last_name LIKE 'KING';

-- Q4: The SQL statement that queries or reads data from a table
--     is ______.
-- answer: (B) SELECT

-- Q5: To remove duplicated rows from the results of an SQL SELECT
--     statement, the ________ qualifier(s) specified
-- answer: (B) UNIQUE, (C) DISTINCT
       
-- Q6: _______ data types uses all the specified length even if the
--     length of the data is less than the specified length.
-- answer: (C) CHAR

-- Q7: What is the way to determine the structure of a table?
-- answer: (D) Using the DESCRIBE(DESC) or INFORMATION(INFO) commands 

-- Q8: How do you select a column named "first_name" from the
--     "employees" table?
-- answer: (C)
SELECT first_name FROM employees;

-- Q9: The BETWEEN keyword is used
-- answer: (B) for ranges

-- Q10: The wild card character % used in strings means
-- answer: (B) any length of characters (including zero).
