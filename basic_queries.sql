/* =========================================
   SQL Fundamentals
   Author: Dhanya
   Source: Mosh Hamedani SQL Course
   ========================================= */

-- Basic SELECT
SELECT *
FROM customers;


-- WHERE clause
SELECT first_name, last_name
FROM customers
WHERE state = 'CA';


-- ORDER BY 
SELECT * FROM sql_store.order_items
WHERE order_id = 2 ORDER BY quantity * unit_price DESC