# Day 9 – Excel for Data Analytics
## Objective
Understand Excel as a data analytics tool for cleaning, validating, summarizing, and analyzing data efficiently.

## Core Excel Features Covered

### 1. Auto Fill & Flash Fill
- Auto Fill: Quickly fills series (numbers, dates, patterns).
- Flash Fill: Extracts or formats data automatically based on detected patterns.
- Common use cases:
  - Splitting full names into first/last names
  - Formatting IDs, phone numbers

### 2. Text to Columns
- Used to split delimited data into multiple columns.
- Common delimiters: comma, space, hyphen.
- Helpful for:
    - Separating names
    - Cleaning imported CSV data

### 3. Data Validation
- Used to restrict incorrect data entry.
- Examples:
    - Date validation (allow dates only in a range)
    - Dropdown lists (categories, status fields)
- Benefit: Improves data quality before analysis.

### 4. Conditional Formatting
- Highlights data based on conditions.
- Examples:
    - Highlight specific payment modes
    - Identify high/low values
- Useful for quick pattern detection.

### 5. Sorting & Filtering
- Sorting: Arrange data (A–Z, Z–A, numeric).
- Filtering: View specific subsets of data.
- Shortcut:
    - Enable filters: Ctrl + Shift + L
 
## Handling Data Quality Issues

### Null Values
- Identify blanks using Go To Special → Blanks
- Options:
    - Remove rows
    - Fill missing values using formulas

### Duplicate Values
- Remove duplicates using Remove Duplicates
- Best applied on unique identifier columns (IDs).

### White Spaces
- Remove extra spaces using:  =TRIM(A1)

## Text Functions in Excel

Commonly used text functions:
- =CONCATENATE(A2," ",B2)
- =LOWER(A2)
- =UPPER(A2)
- =PROPER(A2)
- =LEN(A2)
- =LEFT(A2,4)
- =RIGHT(A2,3)
- =MID(A2,2,4)
- =FIND("k",A2)
- =SEARCH("k",A2)
- =REPLACE(A2,2,3,"abc")
- =SUBSTITUTE(A2,"a","e")

## Logical Functions

### IF
- =IF(A2>2,"Gets Increment","No Increment")

### AND
- =IF(AND(I8>500,G8="Food"),"Discount","No Discount")

### OR
- =IF(OR(I8>500,G8="Grocery"),"Discount","No Discount")

## Date & Time Functions
- =TODAY()
- =NOW()
- =DAY(A2)
- =MONTH(A2)
- =YEAR(A2)
- =DATE(YYYY,MM,DD)
- =HOUR(A2)
- =MINUTE(A2)
- =SECOND(A2)

## Aggregation Functions
- =COUNT(range)
- =COUNTA(range)
- =COUNTIF(range,criteria)
- =COUNTIFS(range1,criteria1,range2,criteria2)

- =SUM(range)
- =SUMIF(criteria_range,criteria,sum_range)
- =SUMIFS(sum_range,criteria_range1,criteria1)

## XLOOKUP
Used to fetch related data across tables.
- =XLOOKUP(lookup_value, lookup_array, return_array, "No Match Found")
Use case: Joining tables using a common key (similar to SQL JOIN).

## Power Query (Intro)
- Used to import, clean, and transform data without coding.
- Common operations:
    - Replace values
    - Trim & clean text
    - Change data types
    - Combine multiple files

## Pivot Tables & Data Modeling (Overview)
- Pivot tables summarize large datasets quickly.
- Power Pivot enables:
    - Relationships between tables
    - Data modeling
    - Advanced analysis

## Key Takeaways
- Excel is powerful for data cleaning and validation
- Functions in Excel mirror SQL and Pandas logic
- Power Query and Pivot Tables are essential analytics tools
- Excel remains highly relevant in real-world data analyst roles