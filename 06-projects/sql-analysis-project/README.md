# 📊 SQL Retail Sales Analytics Project

## Business Problem
- Retail businesses generate large volumes of sales data but often lack clear visibility into revenue drivers, profitability trends, and customer purchasing behavior.
- This project analyzes supermarket sales data using SQL to identify:
   -- Revenue-generating categories
   -- Most profitable regions
   -- High-value customers
   -- Monthly sales trends
   -- Product performance rankings

- The goal is to support data-driven business decision-making.

## Dataset Description
The dataset contains transactional sales records with the following fields:
- order_id
- customer_name
- category
- sub_category
- city
- state
- region
- order_date
- sales
- discount
- profit
Each row represents a single order transaction.

## Key Business Questions Answered

- What is the total sales and total profit?
- Which categories generate the highest revenue?
- Which regions are most profitable?
- Which cities contribute the most sales?
- Who are the top customers by revenue?
- Which sub-categories generate the highest profit?
- What is the profit margin by region?
- How do categories rank by total sales?
- What is the running total of monthly sales?
- What is the month-over-month sales growth?
- Which sub-category performs best within each category?

## SQL Techniques Used
This project demonstrates strong SQL analytical skills, including:
- GROUP BY with aggregate functions (SUM, COUNT, AVG)
- HAVING clause for conditional aggregation
- Subqueries

### Window Functions:
- RANK()
- DENSE_RANK()
- ROW_NUMBER()
- LAG()
- Running totals using OVER()
- Profit margin calculations
- Date formatting and monthly trend analysis

## Key Insights

- A small number of categories contribute the majority of total revenue.
- Certain regions generate high revenue but lower profit margins.
- A few loyal customers account for a significant portion of sales.
- Sales trends show clear monthly growth patterns with some fluctuations.
- Specific sub-categories dominate within each major category.
- Profit margins vary significantly across regions, indicating operational differences.

## Business Recommendations

- Increase inventory and marketing focus on top-performing categories.
- Investigate low-margin regions and optimize pricing or cost structures.
- Implement loyalty programs for high-value customers.
- Reduce excessive discounts in categories with shrinking profit margins.

Expand high-performing sub-categories within profitable regions.

Monitor month-over-month growth to detect early performance decline.
