/* =====================================================
   PROJECT: CRM CUSTOMER RETENTION ANALYSIS
   AUTHOR: Md Sahnawag Hussain
   PURPOSE: Analyze customer retention, engagement,
            and repeat purchase behavior using SQL
   ===================================================== */


/* =====================================================
   1. CREATE TABLES
   ===================================================== */

CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    customer_name TEXT,
    signup_date DATE,
    region TEXT
);

CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE,
    order_value NUMERIC
);

CREATE TABLE interactions (
    interaction_id INT PRIMARY KEY,
    customer_id INT,
    interaction_date DATE,
    interaction_type TEXT
);


/* =====================================================
   2. DATA CLEANING
   ===================================================== */

-- Remove duplicate customer records
CREATE TABLE customers_clean AS
SELECT DISTINCT *
FROM customers;

-- Remove duplicate order records
CREATE TABLE orders_clean AS
SELECT DISTINCT *
FROM orders;

-- Remove duplicate interaction records
CREATE TABLE interactions_clean AS
SELECT DISTINCT *
FROM interactions;

-- Standardize categorical text fields
UPDATE customers_clean
SET region = TRIM(LOWER(region));

UPDATE interactions_clean
SET interaction_type = TRIM(LOWER(interaction_type));


/* =====================================================
   3. CUSTOMER METRICS
   ===================================================== */

-- Total number of customers
SELECT
    COUNT(DISTINCT customer_id) AS total_customers
FROM customers_clean;

-- Customers with more than one order (retained customers)
SELECT
    COUNT(DISTINCT customer_id) AS retained_customers
FROM orders_clean
GROUP BY customer_id
HAVING COUNT(order_id) > 1;


/* =====================================================
   4. RETENTION RATE
   ===================================================== */

SELECT
    COUNT(DISTINCT CASE WHEN order_count > 1 THEN customer_id END) * 100.0
    / COUNT(DISTINCT customer_id) AS retention_rate
FROM (
    SELECT
        customer_id,
        COUNT(order_id) AS order_count
    FROM orders_clean
    GROUP BY customer_id
) t;


/* =====================================================
   5. AVERAGE ORDER VALUE
   ===================================================== */

SELECT
    AVG(order_value) AS average_order_value
FROM orders_clean;


/* =====================================================
   6. REPEAT PURCHASE & CUSTOMER LIFETIME VALUE
   ===================================================== */

SELECT
    customer_id,
    COUNT(order_id) AS total_orders,
    SUM(order_value) AS lifetime_value
FROM orders_clean
GROUP BY customer_id
ORDER BY lifetime_value DESC;


/* =====================================================
   7. CUSTOMER ENGAGEMENT VS RETENTION
   ===================================================== */

SELECT
    c.customer_id,
    COUNT(i.interaction_id) AS interaction_count,
    COUNT(o.order_id) AS order_count
FROM customers_clean c
LEFT JOIN interactions_clean i
    ON c.customer_id = i.customer_id
LEFT JOIN orders_clean o
    ON c.customer_id = o.customer_id
GROUP BY c.customer_id;
