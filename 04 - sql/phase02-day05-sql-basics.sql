
-- SELECT + WHERE
-- Question: Retrieve all customers from a specific country.
SELECT * FROM customers WHERE country = 'India';

-- LIKE
-- Question: Find customers whose names start with the letter 'A'.
SELECT customer_name FROM customers WHERE customer_name LIKE 'A%';

-- IN (Multiple-value filtering)
-- Question: Retrieve customers who belong to India, USA, or UK.
SELECT customer_name FROM customers WHERE country IN ('India', 'UK', 'Canada');

-- BETWEEN
-- Question: Retrieve orders placed between 1000 and 3000.
SELECT amount FROM orders WHERE amount BETWEEN '1000' AND '3000' ;

-- AGGREGATES
-- Question: Calculate total orders, total sales amount, and average order value.
SELECT
    COUNT(order_id) AS total_orders,
    SUM(amount) AS total_sales,
    AVG(amount) AS average_order_value
FROM orders;

-- GROUP BY
-- Question: Calculate the total purchase amount for each customer.
SELECT cust_id, SUM(amount) AS total_amount FROM orders GROUP BY cust_id;

-- HAVING
-- Question: Identify customers whose total purchase amount exceeds 3000.
SELECT
    cust_id,
    SUM(amount) AS total_spent
FROM orders
GROUP BY cust_id
HAVING SUM(amount) > 3000;

-- Summary:
-- Practiced filtering, aggregation, GROUP BY and HAVING using business-driven questions.

