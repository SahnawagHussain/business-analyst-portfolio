--Created the table for csv file to import
create table sales_data (
order_id INT,
customer_id INT,
order_date DATE,
product TEXT,
region TEXT,
sales_channel TEXT,
units_sold INT,
unit_price NUMERIC,
);


SELECT COUNT(*) FROM sales_data;

-- View sample data to understand structure
SELECT * FROM sales_data LIMIT 10;

-- Check missing values in important columns
SELECT *
FROM sales_data
WHERE order_date IS NULL
   OR product IS NULL
   OR region IS NULL
   OR units_sold IS NULL
   OR unit_price IS NULL;

--Removed duplicate rows to avoid inflated revenue.
CREATE TABLE sales_data_clean AS
SELECT DISTINCT *
FROM sales_data;

--Created revenue field for all revenue-based analysis.
ALTER TABLE sales_data_clean
ADD COLUMN revenue NUMERIC;
UPDATE sales_data_clean
SET revenue = units_sold * unit_price;

--Standardize Product & Region Names
UPDATE sales_data_clean
SET product = TRIM(LOWER(product)),
    region  = TRIM(LOWER(region)),
    sales_channel = TRIM(LOWER(sales_channel));

--Total Revenue
SELECT SUM(revenue) AS total_revenue
FROM sales_data_clean;

--Monthly Revenue
SELECT
    TO_CHAR(order_date, 'YYYY-MM') AS month,
    SUM(revenue) AS monthly_revenue
FROM sales_data
GROUP BY month
ORDER BY month;

--Average Order Value
SELECT 
    AVG(revenue) AS average_order_value
FROM sales_data_clean;

--Revenue by Product
SELECT 
    product,
    SUM(revenue) AS total_revenue
FROM sales_data_clean
GROUP BY product
ORDER BY total_revenue DESC;

--Revenue by Region
SELECT 
    region,
    SUM(revenue) AS total_revenue
FROM sales_data_clean
GROUP BY region
ORDER BY total_revenue DESC;

--Revenue by Sales Channel
SELECT 
    sales_channel,
    SUM(revenue) AS total_revenue
FROM sales_data_clean
GROUP BY sales_channel;

--Top performing products
SELECT 
    product,
    SUM(revenue) AS revenue
FROM sales_data_clean
GROUP BY product
ORDER BY revenue DESC
LIMIT 5;

--Sales Trend Over Time
SELECT 
    order_date,
    SUM(revenue) AS daily_revenue
FROM sales_data_clean
GROUP BY order_date
ORDER BY order_date;





