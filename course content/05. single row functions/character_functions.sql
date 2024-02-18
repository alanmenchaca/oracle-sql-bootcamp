-- Character Functions
SELECT LOWER(first_name), UPPER(last_name), INITCAP(job_id)
    FROM employees;
    
SELECT first_name, UPPER(first_name), 
       last_name, LOWER(last_name), 
       email, INITCAP(email),
       UPPER('bmw i8') FROM employees
    WHERE job_id = 'IT_PROG';
       
-- Case-conversion function
SELECT * FROM employees WHERE LOWER(last_name) = 'king';
SELECT * FROM employees WHERE UPPER(last_name) = 'KING';
SELECT * FROM employees WHERE INITCAP(last_name) = 'King';

-----------------------------------------------------------

-- Character Manipulation Functions
SELECT first_name, SUBSTR(first_name, 3, 6), SUBSTR(first_name, 3),
       last_name, LENGTH(last_name) FROM employees;

-- CONCAT(string1, string2): CONCATENATE
SELECT CONCAT(first_name, last_name) FROM employees;
SELECT CONCAT(CONCAT(first_name, last_name), employee_id) FROM employees;
SELECT first_name || last_name || employee_id FROM employees;
 
-- INSTR(string, substring[, position, occurrence])
SELECT INSTR('I am learning how to use functions in Oracle', 'o', 17, 4) FROM dual;
SELECT INSTR('I am learning how to use functions in Oracle', 'o', -1, 3) FROM dual;
SELECT INSTR('I am learning how to use functions in Oracle', 'in', -1, 1) FROM dual;
SELECT first_name, INSTR(first_name, 'a') FROM employees;

-- TRIM([[LEADING|TRAILING|BOTH] trim_character FROM] string)
SELECT TRIM('   My name is Adam   ') trimmed_text FROM dual;
SELECT TRIM(BOTH ' ' FROM '   My name is Adam   ') trimmed_text FROM dual;
SELECT TRIM(BOTH 'm' FROM 'my name is Adammm') trimmed_text FROM dual;
SELECT TRIM(LEADING ' ' FROM '   My name is Adam   ') trimmed_text FROM dual;
SELECT TRIM(TRAILING ' ' FROM '   My name is Adam   ') trimmed_text FROM dual;

-- LTRIM(string, [trim_string])
SELECT LTRIM('   My name is Adam   ') l_trimmed_text FROM dual;
SELECT LTRIM('my name is Adam', 'my') l_trimmed_text FROM dual;

-- RTRIM(string, [trim_string]) 
SELECT RTRIM('   My name is Adam   ') r_trimmed_text FROM dual;

-- real world example
SELECT RTRIM(LTRIM('www.yourwebsite.com', 'www.'), '.com') trimmed_text
    FROM dual;

-- REPLACE(string, string_to_replace[, replacement_string])
SELECT first_name, REPLACE(first_name, 'le', '-') replaced_output 
    FROM employees;
SELECT first_name, REPLACE(first_name, 'und', '-') replaced_output 
    FROM employees;

-- LPAD(string, target_length, padding_expression)
SELECT first_name, LPAD(first_name, 10, '*') left_pad FROM employees;

-- RPAD(string, target_length, padding_expression)
SELECT first_name, RPAD(first_name, 6 ,'*') right_pad FROM employees;
SELECT first_name, RPAD('My name is ' || last_name, 20 ,'-') right_pad 
    FROM employees;
