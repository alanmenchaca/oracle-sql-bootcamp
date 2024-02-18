-- Numeric Functions
-- ROUND(number[, decimal])
SELECT ROUND(12.136) FROM dual; -- 12
SELECT ROUND(12.536, 0) FROM dual; -- 13
SELECT ROUND(12.536, 2) FROM dual; -- 13.54

-- TRUNC(number[, decimal])
SELECT TRUNC(12.536) FROM dual; -- 12
SELECT TRUNC(12.536, 0) FROM dual; -- 12
SELECT TRUNC(12.536, 2) FROM dual; -- 12.53

-- CEIL(number)
SELECT CEIL(12.536) FROM dual; -- 13
SELECT CEIL(12.001) FROM dual; -- 13
SELECT CEIL(12.999) FROM dual; -- 13
SELECT CEIL(12) FROM dual; -- 12

-- FLOOR(number)
SELECT FLOOR(12.12) FROM dual; -- 12
SELECT FLOOR(12.999) FROM dual; -- 12
SELECT FLOOR(12) FROM dual; -- 12

-- MOD(m, n)
SELECT MOD(8, 5) FROM dual; -- 3
SELECT MOD(8, 2) FROM dual; -- 0
SELECT MOD(1800, 70) FROM dual; -- 50
