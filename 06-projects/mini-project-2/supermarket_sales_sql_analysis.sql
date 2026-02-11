-- Creating the database
CREATE DATABASE retail_db;

-- Data is imported using the python code
USE retail_db;
SELECT * FROM supermarket_sales LIMIT 10;

-- Total Sales
SELECT SUM(sales) AS Total_Sales FROM supermarket_sales;

-- Total Profit
SELECT SUM(profit) AS Total_Profit FROM supermarket_sales;

-- Total Sales by Category
SELECT category, ROUND(SUM(sales), 2) AS Total_Sales FROM supermarket_sales
	GROUP BY category 
    ORDER BY Total_Sales DESC;
-- Eggs, Meat & Fish has the highest sales and Oil & Masala has the lowest.

-- Total Profit by Region
SELECT Region, ROUND(SUM(Profit), 2) AS Total_Profit FROM supermarket_sales
	GROUP BY Region
    ORDER BY Total_Profit DESC;
-- West region has the highest profit and North has the lowest.

-- Top 5 Cities by Sales
SELECT City, ROUND(SUM(sales), 2) AS Total_Sales FROM supermarket_sales
	GROUP BY City
    ORDER BY Total_Sales DESC
    LIMIT 5;
-- Kanyakumari generates the highest revenue.


-- Fixing the column names
ALTER TABLE supermarket_sales
CHANGE `Order ID` order_id VARCHAR(20);

ALTER TABLE supermarket_sales
CHANGE `Customer Name` customer_name VARCHAR(100);

ALTER TABLE supermarket_sales
CHANGE `Sub Category` sub_category VARCHAR(100);

ALTER TABLE supermarket_sales
CHANGE `Order Date` order_date VARCHAR(45);

-- Customers with More Than 2 Orders
SELECT customer_name, COUNT(order_id) AS total_orders FROM supermarket_sales
	GROUP BY customer_name
    HAVING COUNT(order_id) > 2
    ORDER BY total_orders ASC;
    
-- Most Profitable Sub-Category
SELECT sub_category, ROUND(SUM(Profit), 2) AS total_profit FROM supermarket_sales
	GROUP BY sub_category
    ORDER BY total_profit DESC
    LIMIT 1;
    
-- Category with Profit > 50,000
SELECT Category, ROUND(SUM(Profit), 2) AS total_profit FROM supermarket_sales
	GROUP BY Category
    HAVING SUM(Profit) > 50000
    ORDER BY total_profit DESC;

-- Region with Highest Profit Margin
SELECT Region, ROUND(SUM(Profit) / SUM(Sales) * 100, 2) AS profit_margin_percent FROM supermarket_sales
	GROUP BY Region
    ORDER BY profit_margin_percent
    LIMIT 1;

-- Rank Categories by Total Sales
SELECT 
    category,
    SUM(sales) AS total_sales,
    RANK() OVER (ORDER BY SUM(sales) DESC) AS sales_rank
FROM supermarket_sales
GROUP BY category;

-- Top 10 customers
SELECT * FROM (SELECT 
        customer_name,
        SUM(sales) AS total_sales,
        DENSE_RANK() OVER (ORDER BY SUM(sales) DESC) AS sales_rank
    FROM supermarket_sales
    GROUP BY customer_name
) ranked
WHERE sales_rank <= 3;
-- densed rank is used because when two customers tie, both will get the same rank.

-- Running Total of Monthly Sales
SELECT 
    DATE_FORMAT(order_date, '%Y-%m') AS month,
    SUM(sales) AS monthly_sales,
    SUM(SUM(sales)) OVER (ORDER BY DATE_FORMAT(order_date, '%Y-%m')) AS running_total
FROM supermarket_sales
GROUP BY month
ORDER BY month;

-- Month-over-Month Growth
SELECT month, monthly_sales,
    LAG(monthly_sales) OVER (ORDER BY month) AS previous_month_sales,
    ROUND(
        (monthly_sales - LAG(monthly_sales) OVER (ORDER BY month)) 
        / LAG(monthly_sales) OVER (ORDER BY month) * 100, 
    2) AS growth_percentage
FROM (
    SELECT 
        DATE_FORMAT(order_date, '%Y-%m') AS month,
        SUM(sales) AS monthly_sales
    FROM supermarket_sales
    GROUP BY month
) t;

-- Top Product per Category
SELECT * FROM (SELECT category, sub_category, SUM(sales) AS total_sales,
        ROW_NUMBER() OVER (
            PARTITION BY category 
            ORDER BY SUM(sales) DESC
        ) AS rank_within_category
    FROM supermarket_sales
    GROUP BY category, sub_category
) ranked
WHERE rank_within_category = 1;


