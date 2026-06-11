CREATE DATABASE retail_analysis;
USE retail_analysis;
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    age INT,
    gender VARCHAR(10),
    item_purchased VARCHAR(50),
    category VARCHAR(30),
    purchase_amount DECIMAL(10,2),
    location VARCHAR(50),
    size VARCHAR(5),
    color VARCHAR(30),
    season VARCHAR(30),
    review_rating DECIMAL(3,1),
    subscription_status VARCHAR(5),
    shipping_type VARCHAR(30),
    discount_applied VARCHAR(5),
    promo_code_used VARCHAR(5),
    previous_purchases INT,
    payment_method VARCHAR(30),
    frequency_of_purchases VARCHAR(20),
    age_group VARCHAR(50),
    customer_segment VARCHAR(50),
    promo_group VARCHAR(50)
);
SELECT COUNT(*) FROM customers;
SELECT 
    category,
    SUM(purchase_amount) AS total_revenue,
    COUNT(*) AS total_orders,
    ROUND(AVG(purchase_amount), 2) AS avg_order_value
FROM customers
GROUP BY category
ORDER BY total_revenue DESC;
SELECT 
    discount_applied,
    ROUND(AVG(purchase_amount), 2) AS avg_purchase,
    COUNT(*) AS total_orders
FROM customers
GROUP BY discount_applied;
SELECT 
    gender,
    SUM(purchase_amount) AS total_revenue,
    COUNT(*) AS total_customers,
    ROUND(AVG(purchase_amount), 2) AS avg_spend
FROM customers
GROUP BY gender
ORDER BY total_revenue DESC;
SELECT 
    subscription_status,
    COUNT(*) AS total_customers,
    SUM(purchase_amount) AS total_revenue,
    ROUND(AVG(purchase_amount), 2) AS avg_spend
FROM customers
GROUP BY subscription_status;
SET sql_mode = '';
SELECT 
    CASE 
        WHEN previous_purchases <= 1 THEN 'New'
        WHEN previous_purchases BETWEEN 2 AND 4 THEN 'Returning'
        ELSE 'Loyal'
    END AS customer_segment,
    COUNT(*) AS total_customers,
    ROUND(AVG(purchase_amount), 2) AS avg_spend,
    SUM(purchase_amount) AS total_revenue
FROM customers
GROUP BY customer_segment
ORDER BY total_customers DESC;
SELECT category, item_purchased, order_count, category_rank
FROM (
    SELECT 
        category,
        item_purchased,
        COUNT(*) AS order_count,
        RANK() OVER (PARTITION BY category 
                     ORDER BY COUNT(*) DESC) AS category_rank
    FROM customers
    GROUP BY category, item_purchased
) ranked
WHERE category_rank <= 3
ORDER BY category, category_rank;
SELECT 
    CASE 
        WHEN age <= 25 THEN '18-25'
        WHEN age <= 35 THEN '26-35'
        WHEN age <= 50 THEN '36-50'
        ELSE '51+'
    END AS age_group,
    COUNT(*) AS total_customers,
    SUM(purchase_amount) AS total_revenue,
    ROUND(AVG(purchase_amount), 2) AS avg_spend
FROM customers
GROUP BY age_group
ORDER BY total_revenue DESC;
SELECT 
    CASE
        WHEN discount_applied = 'Yes' AND promo_code_used = 'Yes' THEN 'Both Applied'
        WHEN discount_applied = 'No' AND promo_code_used = 'Yes' THEN 'Promo Only'
        WHEN discount_applied = 'Yes' AND promo_code_used = 'No' THEN 'Discount Only'
        ELSE 'Neither'
    END AS promo_group,
    COUNT(*) AS total_orders,
    ROUND(AVG(purchase_amount), 2) AS avg_spend,
    SUM(purchase_amount) AS total_revenue
FROM customers
GROUP BY promo_group
ORDER BY avg_spend DESC;
SELECT 
    customer_id,
    purchase_amount,
    SUM(purchase_amount) OVER (ORDER BY purchase_amount DESC) AS cumulative_revenue,
    ROUND(
        SUM(purchase_amount) OVER (ORDER BY purchase_amount DESC) / 
        SUM(purchase_amount) OVER () * 100, 2
    ) AS cumulative_percentage
FROM customers
ORDER BY purchase_amount DESC
LIMIT 20;
SELECT 
    season,
    COUNT(*) AS total_orders,
    SUM(purchase_amount) AS total_revenue,
    ROUND(AVG(purchase_amount), 2) AS avg_order_value,
    ROUND(
        SUM(purchase_amount) * 100.0 / SUM(SUM(purchase_amount)) OVER (), 2
    ) AS revenue_percentage
FROM customers
GROUP BY season
ORDER BY total_revenue DESC;
SELECT 
    frequency_of_purchases,
    COUNT(*) AS total_customers,
    ROUND(AVG(purchase_amount), 2) AS avg_spend,
    SUM(purchase_amount) AS total_revenue
FROM customers
GROUP BY frequency_of_purchases
ORDER BY avg_spend DESC;
SELECT 
    subscription_status,
    COUNT(*) AS loyal_customers,
    ROUND(AVG(purchase_amount), 2) AS avg_spend,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER (), 2) AS percentage
FROM customers
WHERE previous_purchases > 4
GROUP BY subscription_status;