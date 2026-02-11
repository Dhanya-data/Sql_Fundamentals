-- INNER JOIN 
SELECT * FROM order_items o
INNER JOIN customers c 
ON o.order_id = c.customer_id;

-- LEFT JOIN 
USE sql_store;
SELECT p.product_id, p.name, oi.quantity FROM products p
LEFT JOIN order_items oi
ON p.product_id = oi.product_id;

USE sql_store;
SELECT c.customer_id, c.first_name, o.order_id, s.name FROM orders o
JOIN customers c
ON o.customer_id = c.customer_id
LEFT JOIN shippers s
ON o.shipper_id = s.shipper_id
ORDER BY c.customer_id;

-- USING KEYWORD

USE sql_invoicing;
SELECT p.date, 
	   c.name AS client, 
       p.amount, 
       pm.name AS Payment_method
FROM payments p
JOIN clients c USING(client_id)
JOIN payment_methods pm
	ON p.payment_id = pm.payment_method_id;

-- CROSS JOINS
-- Explicit syntax

USE sql_store;
SELECT p.product_id, s.name
from shippers s
CROSS JOIN products p
ORDER BY s.name;

-- Implicit Syntax

USE sql_store;
SELECT p.product_id, s.name
from shippers s, products p
ORDER BY s.name;

-- UNIONS 

USE sql_store;

SELECT customer_id, 
	   first_name,
       points, 
	   'Bronze' AS type
FROM customers
WHERE points < 2000
UNION
SELECT customer_id, 
	   first_name,
       points, 
	   'Silver' AS type
FROM customers
WHERE points BETWEEN 2000 AND 3000
UNION
SELECT customer_id, 
	   first_name,
       points, 
	   'Gold' AS type
FROM customers
WHERE points > 3000 
ORDER BY first_name;