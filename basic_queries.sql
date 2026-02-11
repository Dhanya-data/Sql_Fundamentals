/* =========================================
   SQL Fundamentals
   Author: Dhanya
   Source: Mosh Hamedani SQL Course
   ========================================= */

-- Basic SELECT
USE sql_store;
SELECT *
FROM customers;

-- WHERE clause
USE sql_store;
SELECT first_name, last_name
FROM customers
WHERE state = 'CA';

-- IS NULL
USE sql_store;
SELECT * FROM sql_store.orders
WHERE shipped_date IS NULL ;

-- ORDER BY 
USE sql_store;
SELECT * FROM sql_store.order_items
WHERE order_id = 2 ORDER BY quantity * unit_price DESC;

-- INSERTING MULTIPLE ROWS 
USE sql_inventory;
INSERT INTO products (name, quantity_in_stock, unit_price)
VALUES ('Chicken Fry', 28, 15.99),
	   ('Chicken curry', 45, 20.99),
       ('Chicken Biryani', 32, 34.99);
       
-- DELETING ROWS
USE sql_inventory;
DELETE FROM products
WHERE product_id >=14;

-- CREATING NEW TABLE USING EXISTING DATA 
USE sql_invoicing;
CREATE TABLE invoices_archived AS
SELECT i.invoice_id, i.number, c.name, i.invoice_total
FROM invoices i
JOIN clients c
USING (client_id)
WHERE i.payment_date IS NOT NULL;

-- UPDATING MULTIPLE ROWS 
USE sql_store;
UPDATE customers 
SET points = points + 50
WHERE birth_date < '1990-01-01';

-- SUBQUERIES IN UPDATES        
USE sql_store;
UPDATE ORDERS
SET comments = 'GOLD CUSTOMERS'
WHERE customer_id IN 
	(SELECT customer_id FROM customers
	WHERE points > 3000);