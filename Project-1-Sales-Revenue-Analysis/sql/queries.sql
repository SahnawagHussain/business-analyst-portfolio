/* =====================================================
   SALES DATA ANALYSIS
   Author: Md Sahnawag Hussain
   Purpose: Data Cleaning & Business Analysis using SQL
   ===================================================== */

/* 1. CREATE RAW TABLE */
CREATE TABLE sales_data (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    product TEXT,
    region TEXT,
    sales_channel TEXT,
    units_sold INT,
    unit_price NUMERIC
);

/* 2. BASIC DATA CHECK */
SELECT COUNT(*) AS total_records
FROM sales_data;

SELECT *
FROM sales_data
LIMIT 10;

/* 3. CHECK FOR MISSING VALUES */
SELECT COUNT(*) AS missing_value_records
FROM sales_data
WHERE order_date IS NULL
   OR product IS NULL
   OR region IS NULL
   OR sales_channel IS NULL
   OR units_sold IS NULL
   OR unit_price IS NULL;

/* 4. REMOVE DUPLICATES */
CREATE TABLE sales_data_clean AS
SELECT *
FROM (
    SELECT *,
           ROW_NUMBER() OVER (PARTITION BY order_id ORDER BY order_date) AS rn
    FROM sales_data
) t
WHERE rn = 1;

/* 5. STANDARDIZE TEXT DATA */
UPDATE sales_data_clean
SET product = TRIM(LOWER(product)),
    region = TRIM(LOWER(region)),
    sales_channel = TRIM(LOWER(sales_channel));

/* 6. ADD REVENUE COLUMN */
ALTER TABLE sales_data_clean
ADD COLUMN revenue NUMERIC;

UPDATE sales_data_clean
SET revenue = units_sold * unit_price;

/* =====================================================
   BUSINESS ANALYSIS QUERIES
   ===================================================== */

/* Total Revenue */
SELECT SUM(revenue) AS total_revenue
FROM sales_data_clean;

/* Average Order Value */
SELECT AVG(revenue) AS average_order_value
FROM sales_data_clean;

/* Monthly Revenue Trend */
SELECT
    TO_CHAR(order_date, 'YYYY-MM') AS month,
    SUM(revenue) AS monthly_revenue
FROM sales_data_clean
GROUP BY month
ORDER BY month;

/* Revenue by Product */
SELECT
    product,
    SUM(revenue) AS total_revenue
FROM sales_data_clean
GROUP BY product
ORDER BY total_revenue DESC;

/* Revenue by Region */
SELECT
    region,
    SUM(revenue) AS total_revenue
FROM sales_data_clean
GROUP BY region
ORDER BY total_revenue DESC;

/* Revenue by Sales Channel */
SELECT
    sales_channel,
    SUM(revenue) AS total_revenue
FROM sales_data_clean
GROUP BY sales_channel
ORDER BY total_revenue DESC;

/* Top 5 Products */
SELECT
    product,
    SUM(revenue) AS revenue
FROM sales_data_clean
GROUP BY product
ORDER BY revenue DESC
LIMIT 5;

/* Daily Sales Trend */
SELECT
    order_date,
    SUM(revenue) AS daily_revenue
FROM sales_data_clean
GROUP BY order_date
ORDER BY order_date;

