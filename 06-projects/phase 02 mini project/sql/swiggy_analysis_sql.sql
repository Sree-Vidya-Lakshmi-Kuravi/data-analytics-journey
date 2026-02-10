CREATE DATABASE swiggy_analysis;
USE swiggy_analysis;

SHOW TABLES;

SELECT COUNT(*) FROM orders_cleaned;
SELECT * FROM orders_cleaned LIMIT 5;

-- Total Revenue by Restaurant
SELECT
    r.restaurant_name,
    SUM(o.total_order_value) AS total_revenue
FROM orders_cleaned o
JOIN restaurants r
    ON o.restaurant_id = r.restaurant_id
GROUP BY r.restaurant_name
ORDER BY total_revenue DESC;

-- Top 10 Customers by Revenue
SELECT
    c.customer_name,
    SUM(o.total_order_value) AS customer_revenue
FROM orders_cleaned o
JOIN customers c
    ON o.customer_id = c.customer_id
GROUP BY c.customer_name
ORDER BY customer_revenue DESC
LIMIT 10;

-- Order Status Distribution
SELECT
    order_status,
    COUNT(*) AS total_orders,
    ROUND(
        COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (),
        2
    ) AS percentage
FROM orders_cleaned
GROUP BY order_status;

-- Top Ordered Dishes
SELECT
    dish_ordered,
    COUNT(*) AS order_count
FROM orders_cleaned
GROUP BY dish_ordered
ORDER BY order_count DESC
LIMIT 10;

-- Delivery Partner Performance
SELECT
    d.partner_name,
    AVG(o.delivery_delay) AS avg_delivery_delay,
    RANK() OVER (ORDER BY AVG(o.delivery_delay)) AS performance_rank
FROM orders_cleaned o
JOIN delivery_partners d
    ON o.delivery_partner_id = d.partner_id
GROUP BY d.partner_name;

