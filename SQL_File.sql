-- Sales Performance
SELECT sale_date, SUM(total_sale) AS daily_sales
FROM sales
GROUP BY sale_date
ORDER BY sale_date;

-- Customer Analysis
SELECT customer_id, SUM(total_sale) AS total_spent
FROM sales
GROUP BY customer_id
LIMIT 20;

-- Product/Category Insights
SELECT category, SUM(quantiy) AS total_units_sold, SUM(total_sale) AS total_sales, SUM(total_sale - cogs) AS total_profit 
FROM sales
GROUP BY category;

-- Gender & Age-Based Analysis
SELECT
  CASE
    WHEN age < 20 THEN 'Under 20'
    WHEN age BETWEEN 20 AND 29 THEN '20-29'
    WHEN age BETWEEN 30 AND 39 THEN '30-39'
    ELSE '40+'
  END AS age_group,
  SUM(total_sale) AS total_sales
FROM sales
GROUP BY age_group;

-- Profitability Analysis
SELECT SUM(total_sale) AS total_sales, SUM(cogs) AS total_cost, 
       (SUM(total_sale) - SUM(cogs)) AS total_profit,
       ROUND(((SUM(total_sale) - SUM(cogs)) / SUM(total_sale)) * 100, 2) AS profit_margin_percentage
FROM sales;

-- Average Basket Size
SELECT AVG(total_sale) AS avg_transaction_value
FROM sales;
