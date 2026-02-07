-- INNER JOIN
-- Question: Retrieve customers who have placed at least one order.
-- INNER JOIN is used to include only customers with matching orders.
SELECT c.cust_id, c.customer_name FROM customers c
     INNER JOIN orders o
     ON c.cust_id = o.cust_id;

-- LEFT JOIN
-- Question: List all customers along with their orders, including those with no orders.
-- LEFT JOIN is used to retain all customers even if they have no matching orders.
SELECT c.cust_id, c.customer_name FROM customers c
     LEFT JOIN orders o
     ON c.cust_id = o.cust_id;
    
-- JOIN + AGGREGATION
-- Question: Calculate total spending per customer, including customers with no orders.
-- LEFT JOIN ensures all customers are included in the analysis.
SELECT
    c.cust_id,
    c.customer_name,
    SUM(o.amount) AS total_spent
FROM customers c
LEFT JOIN orders o
    ON c.cust_id = o.cust_id
GROUP BY
    c.cust_id,
    c.customer_name;

-- Summary:
-- Practiced INNER and LEFT JOINs with clear reasoning tied to business questions.
-- Combined joins with aggregation to produce customer-level insights.
