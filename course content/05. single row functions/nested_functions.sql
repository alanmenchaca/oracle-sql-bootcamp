-- Nested Functions
SELECT SUBSTR('John Smith', INSTR('John Smith', ' ') + 1, LENGTH('John Smith')) output 
FROM dual;
SELECT SUBSTR('John Smith', INSTR('John Smith', ' ') + 1) output FROM dual;

SELECT first_name || ' ' || last_name AS full_name,
SUBSTR(first_name || ' ' || last_name, 
       INSTR(first_name || ' ' || last_name, ' ') + 1) output 
    FROM employees; 

SELECT CONCAT(CONCAT(first_name, ' '), last_name) AS full_name,
SUBSTR(CONCAT(CONCAT(first_name, ' '), last_name), 
       INSTR(CONCAT(CONCAT(first_name, ' '), last_name), ' ') + 1) output 
    FROM employees; 
