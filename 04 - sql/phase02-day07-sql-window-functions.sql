-- Window Functions

-- Question: Assign a unique rank to each employee within their department based on sales.
-- Window function is used to rank records without collapsing rows.
-- ROW_NUMBER()
SELECT
    *, ROW_NUMBER() OVER (
        PARTITION BY department
        ORDER BY sales_amount DESC) AS row_num
FROM employee_sales;

-- RANK()
-- Question: Rank employees within each department based on sales, allowing gaps for ties.
-- RANK is used to show relative performance with skipped rankings.
SELECT
    *, RANK() OVER (
        PARTITION BY department
        ORDER BY sales_amount DESC) AS rank1
FROM employee_sales;

--DENSE_RANK()
-- Question: Rank employees within each department without gaps in ranking.
-- DENSE_RANK is used when consecutive ranking is required.
SELECT
    *, DENSE_RANK() OVER (
        PARTITION BY department
        ORDER BY sales_amount DESC) AS dense_rank1
FROM employee_sales;

-- Top 2 per Department
-- Question: Identify the top 2 sales performers in each department.
-- Window function is required to filter top-N records per group.
SELECT *
FROM (
    SELECT
        *,
        DENSE_RANK() OVER (
            PARTITION BY department
            ORDER BY sales_amount DESC
        ) AS rank_in_dept
    FROM employee_sales
) ranked
WHERE rank_in_dept <= 2;

--Window Functions vs GROUP BY
-- Find total sales per department.

-- GROUP BY approach: Best when only aggregated results are needed.
SELECT
    department,
    SUM(sales_amount) AS total_sales
FROM employee_sales
GROUP BY department;

-- Window function approach: Used when both row-level data and aggregates are required together.
SELECT *,
    SUM(sales_amount) OVER (PARTITION BY department) AS dept_total_sales
FROM employee_sales;

-- GROUP BY is better when only summary-level results are needed.
-- Window functions are required when row-level details must be preserved
-- along with aggregated values.


-- Consolidation
-- Question: Rank customers by total spending within each country.
-- JOIN combines customer and order data, window function ranks within groups.
SELECT
    c.cust_id,
    c.customer_name,
    c.country,
    SUM(o.amount) AS total_spent,
    RANK() OVER (
        PARTITION BY c.country
        ORDER BY SUM(o.amount) DESC
    ) AS country_rank
FROM customers c
JOIN orders o
    ON c.cust_id = o.cust_id
GROUP BY
    c.cust_id,
    c.customer_name,
    c.country;


-- Summary:
-- Window functions allow advanced analytical operations without collapsing rows.
-- They are commonly used for ranking, top-N analysis, and running totals.
-- In interviews, window functions are tested to evaluate analytical SQL thinking.
