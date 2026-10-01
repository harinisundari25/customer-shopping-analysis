SELECT
    COUNT(*) AS total_customers,
    SUM(purchase_amount) AS total_revenue,
    ROUND(AVG(purchase_amount), 2) AS average_purchase_amount
FROM customer;
-- 2. Sales performance by category
SELECT
    category,
    COUNT(*) AS total_purchases,
    SUM(purchase_amount) AS total_revenue,
    ROUND(AVG(purchase_amount), 2) AS average_purchase_amount
FROM customer
GROUP BY category
ORDER BY total_revenue DESC;
-- 3. Sales performance by gender
SELECT
    gender,
    COUNT(*) AS total_purchases,
    SUM(purchase_amount) AS total_revenue,
    ROUND(AVG(purchase_amount), 2) AS average_purchase_amount
FROM customer
GROUP BY gender
ORDER BY total_revenue DESC;
-- 4. Subscription status analysis
SELECT
    subscription_status,
    COUNT(*) AS total_customers,
    SUM(purchase_amount) AS total_revenue,
    ROUND(AVG(purchase_amount), 2) AS average_purchase_amount
FROM customer
GROUP BY subscription_status
ORDER BY total_revenue DESC;
-- 5. Sales performance by age group
SELECT
    age_group,
    COUNT(*) AS total_customers,
    SUM(purchase_amount) AS total_revenue,
    ROUND(AVG(purchase_amount), 2) AS average_purchase_amount
FROM customer
GROUP BY age_group
ORDER BY total_revenue DESC;
-- 6. Sales performance by payment method
SELECT
    payment_method,
    COUNT(*) AS total_purchases,
    SUM(purchase_amount) AS total_revenue,
    ROUND(AVG(purchase_amount), 2) AS average_purchase_amount
FROM customer
GROUP BY payment_method
ORDER BY total_revenue DESC;
-- 7. Sales performance by shipping type
SELECT
    shipping_type,
    COUNT(*) AS total_orders,
    SUM(purchase_amount) AS total_revenue,
    ROUND(AVG(purchase_amount), 2) AS average_purchase_amount
FROM customer
GROUP BY shipping_type
ORDER BY total_revenue DESC;
-- 8. Discount impact analysis
SELECT
    discount_applied,
    COUNT(*) AS total_orders,
    SUM(purchase_amount) AS total_revenue,
    ROUND(AVG(purchase_amount), 2) AS average_purchase_amount
FROM customer
GROUP BY discount_applied
ORDER BY total_revenue DESC;
-- 9. Product performance analysis
SELECT
    item_purchased,
    COUNT(*) AS total_purchases,
    SUM(purchase_amount) AS total_revenue,
    ROUND(AVG(purchase_amount), 2) AS average_purchase_amount
FROM customer
GROUP BY item_purchased
ORDER BY total_revenue DESC;
-- 10. Seasonal sales analysis
SELECT
    season,
    COUNT(*) AS total_orders,
    SUM(purchase_amount) AS total_revenue,
    ROUND(AVG(purchase_amount), 2) AS average_purchase_amount
FROM customer
GROUP BY season
ORDER BY total_revenue DESC;
-- 11. Purchase frequency analysis
SELECT
    frequency_of_purchases,
    purchase_frequency_days,
    COUNT(*) AS total_customers,
    SUM(purchase_amount) AS total_revenue,
    ROUND(AVG(purchase_amount), 2) AS average_purchase_amount
FROM customer
GROUP BY frequency_of_purchases, purchase_frequency_days
ORDER BY purchase_frequency_days;
-- 12. Review rating analysis
SELECT
    ROUND(review_rating, 1) AS rating,
    COUNT(*) AS total_reviews,
    ROUND(AVG(purchase_amount), 2) AS average_purchase_amount,
    SUM(purchase_amount) AS total_revenue
FROM customer
GROUP BY ROUND(review_rating, 1)
ORDER BY rating DESC;
-- 13. Customer loyalty analysis
SELECT
    CASE
        WHEN previous_purchases = 1 THEN '1 Purchase'
        WHEN previous_purchases BETWEEN 2 AND 5 THEN '2-5 Purchases'
        WHEN previous_purchases BETWEEN 6 AND 10 THEN '6-10 Purchases'
        WHEN previous_purchases BETWEEN 11 AND 20 THEN '11-20 Purchases'
        WHEN previous_purchases BETWEEN 21 AND 30 THEN '21-30 Purchases'
        WHEN previous_purchases BETWEEN 31 AND 40 THEN '31-40 Purchases'
        ELSE '41+ Purchases'
    END AS purchase_history_group,
    COUNT(*) AS total_customers,
    SUM(purchase_amount) AS total_revenue,
    ROUND(AVG(purchase_amount), 2) AS average_purchase_amount
FROM customer
GROUP BY purchase_history_group
ORDER BY MIN(previous_purchases);
-- 14. Category and season analysis
SELECT
    category,
    season,
    COUNT(*) AS total_orders,
    SUM(purchase_amount) AS total_revenue,
    ROUND(AVG(purchase_amount), 2) AS average_purchase_amount
FROM customer
GROUP BY category, season
ORDER BY category, total_revenue DESC;
