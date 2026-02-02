-- ============================================
-- Day 8: MySQL for Data Analytics (WsCube)
-- Topics Covered:
-- SELECT, WHERE, AND, OR, NOT, LIKE
-- ORDER BY, LIMIT, BETWEEN, IN, NOT IN
-- String Functions, Aggregate Functions
-- Date Functions, CASE
-- GROUP BY, HAVING
-- Joins, Set Operators
-- Subqueries, Views
-- Stored Procedures
-- Window Functions
-- ============================================


-- ===============================
-- BASIC SELECT QUERIES
-- ===============================

-- Select all columns
SELECT * FROM demo.employees;

-- Select specific columns
SELECT EmployeeID, FirstName FROM demo.employees;


-- ===============================
-- WHERE CLAUSE
-- ===============================

SELECT * 
FROM demo.employees 
WHERE City = 'Hyderabad';

SELECT FirstName, SalaryINR 
FROM demo.employees 
WHERE JobTitle = 'Logistics Coordinator';


-- ===============================
-- AND / OR / NOT OPERATORS
-- ===============================

SELECT FirstName, SalaryINR, JobTitle, City
FROM demo.employees
WHERE JobTitle = 'Logistics Coordinator'
AND City = 'Hyderabad';

SELECT FirstName, SalaryINR, JobTitle, City
FROM demo.employees
WHERE City = 'Chennai'
OR JobTitle = 'HR Executive';

SELECT FirstName, SalaryINR, JobTitle, WorkMode
FROM demo.employees
WHERE NOT WorkMode = 'Hybrid';


-- ===============================
-- LIKE OPERATOR
-- ===============================

SELECT FirstName, LastName
FROM demo.employees
WHERE FirstName LIKE '%ma%';


-- ===============================
-- ORDER BY
-- ===============================

SELECT FirstName, JobTitle
FROM demo.employees
ORDER BY JobTitle;

SELECT FirstName, JobTitle
FROM demo.employees
ORDER BY JobTitle DESC;

SELECT FirstName, JobTitle, Age
FROM demo.employees
ORDER BY JobTitle ASC, Age DESC;


-- ===============================
-- LIMIT
-- ===============================

SELECT FirstName, JobTitle, SalaryINR
FROM demo.employees
ORDER BY SalaryINR DESC
LIMIT 5;

SELECT * 
FROM demo.employees
LIMIT 10;

SELECT * 
FROM demo.employees
LIMIT 5, 10;


-- ===============================
-- BETWEEN
-- ===============================

SELECT FirstName, JobTitle, Age
FROM demo.employees
WHERE Age BETWEEN 20 AND 30;


-- ===============================
-- IN / NOT IN
-- ===============================

SELECT FirstName, JobTitle, Age
FROM demo.employees
WHERE JobTitle IN ('HR Executive', 'Senior Analyst', 'IT Manager');

SELECT FirstName, JobTitle, Age
FROM demo.employees
WHERE JobTitle NOT IN ('HR Executive', 'Senior Analyst', 'IT Manager', 'Logistics Coordinator');


-- ===============================
-- STRING FUNCTIONS
-- ===============================

SELECT CONCAT(FirstName, ' ', LastName, ' - ', Age) AS FullName_Age
FROM demo.employees;

SELECT CONCAT_WS(' - ', FirstName, LastName, Age) AS FullName_Age
FROM demo.employees;

SELECT JobTitle, LENGTH(JobTitle) AS JobTitle_Length
FROM demo.employees;

SELECT UPPER(CONCAT(FirstName, ' ', LastName)) AS FullName
FROM demo.employees;

SELECT LOWER(CONCAT(FirstName, ' ', LastName)) AS FullName
FROM demo.employees;

SELECT LEFT(FirstName, 4) AS First_4_Letters
FROM demo.employees;

SELECT RIGHT(FirstName, 3) AS Last_3_Letters
FROM demo.employees;

SELECT MID(LastName, 2, 3) AS Mid_3_Letters
FROM demo.employees;


-- ===============================
-- AGGREGATE FUNCTIONS
-- ===============================

SELECT SUM(SalaryINR) AS Total_Salary FROM demo.employees;
SELECT COUNT(EmployeeID) AS Employee_Count FROM demo.employees;
SELECT AVG(SalaryINR) AS Avg_Salary FROM demo.employees;
SELECT MAX(SalaryINR) AS Max_Salary, MIN(SalaryINR) AS Min_Salary FROM demo.employees;


-- ===============================
-- DATE FUNCTIONS
-- ===============================

SELECT DATE(payment_date) FROM sakila.payment;
SELECT TIME(payment_date) FROM sakila.payment;
SELECT DATEDIFF(last_update, payment_date) FROM sakila.payment;
SELECT DAY(payment_date), MONTH(payment_date), YEAR(payment_date) FROM sakila.payment;
SELECT DAYNAME(payment_date), MONTHNAME(payment_date) FROM sakila.payment;


-- ===============================
-- CASE STATEMENT
-- ===============================

SELECT productName, quantityInStock,
CASE
    WHEN quantityInStock < 6000 THEN 'Urgent restock needed'
    ELSE 'Stock sufficient'
END AS Stock_Status
FROM classicmodels.products;


-- ===============================
-- GROUP BY & HAVING
-- ===============================

SELECT JobTitle, COUNT(EmployeeID) AS Employee_Count
FROM demo.employees
GROUP BY JobTitle;

SELECT JobTitle, COUNT(EmployeeID) AS Employee_Count
FROM demo.employees
GROUP BY JobTitle
HAVING COUNT(EmployeeID) > 5;


-- ===============================
-- JOINS
-- ===============================

-- INNER JOIN
SELECT p.productName, SUM(o.quantityOrdered) AS Total_Orders
FROM products p
INNER JOIN orderdetails o
ON p.productCode = o.productCode
GROUP BY p.productName;

-- LEFT JOIN
SELECT p.productName, o.quantityOrdered
FROM products p
LEFT JOIN orderdetails o
ON p.productCode = o.productCode;

-- RIGHT JOIN
SELECT p.productName, o.quantityOrdered
FROM products p
RIGHT JOIN orderdetails o
ON p.productCode = o.productCode;


-- ===============================
-- SET OPERATORS
-- ===============================

-- UNION
SELECT student_id, student_name FROM course_a_students
UNION
SELECT student_id, student_name FROM course_b_students;

-- UNION ALL
SELECT student_id, student_name FROM course_a_students
UNION ALL
SELECT student_id, student_name FROM course_b_students;


-- ===============================
-- SUBQUERIES
-- ===============================

SELECT CustomerName, creditLimit
FROM classicmodels.customers
WHERE creditLimit >
(
    SELECT AVG(creditLimit)
    FROM classicmodels.customers
);


-- ===============================
-- VIEWS
-- ===============================

CREATE VIEW customer_count AS
SELECT country, COUNT(customerNumber) AS Cust_Count
FROM classicmodels.customers
GROUP BY country;

SELECT * FROM customer_count;


-- ===============================
-- STORED PROCEDURES
-- ===============================

DELIMITER &&
CREATE PROCEDURE get_customers()
BEGIN
    SELECT * FROM classicmodels.customers;
END &&
DELIMITER ;

CALL get_customers();


-- ===============================
-- WINDOW FUNCTIONS
-- ===============================

SELECT FirstName, JobTitle, City,
SUM(SalaryINR) OVER (PARTITION BY JobTitle) AS Total_Salary
FROM demo.employees;
