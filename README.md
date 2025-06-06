# Data-Analyze-with-MySQL
We can analyze the sales data with MySQL Database. So that becomes a good practice for database queries.

## These are the insights and the problem i solved in it.

### 1 Sales Performance.
- Total sales over time
- Daily, weekly, or monthly sales trends
- Top-performing days or hours

```
SELECT sale_date, SUM(total_sale) AS daily_sales
FROM sales
GROUP BY sale_date
ORDER BY sale_date;
```

### 2 Customer Analysis.
- Most valuable customers (by total purchases)
- Customer repeat rate
- Customer demographics (gender, age group)

```
SELECT customer_id, SUM(total_sale) AS total_spent
FROM sales
GROUP BY customer_id
LIMIT 10;
```

### 3 Product/Category Insights.
- Top-selling products/categories
- Total quantity sold per category
- Profit per category (Total Sale - COGS)

```
SELECT category, SUM(quantiy) AS total_units_sold, SUM(total_sale) AS total_sales, SUM(total_sale - cogs) AS total_profit 
FROM sales
GROUP BY category;
```

### 4 Gender & Age-Based Analysis.
- Sales by gender
- Sales by age group (e.g., <20, 20–30, 30–40, etc.)

```
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
```

### 5 Profitability Analysis.
- Overall profit margin
- Profit per unit/category/customer

```
SELECT SUM(total_sale) AS total_sales, SUM(cogs) AS total_cost, 
       (SUM(total_sale) - SUM(cogs)) AS total_profit,
       ROUND(((SUM(total_sale) - SUM(cogs)) / SUM(total_sale)) * 100, 2) AS profit_margin_percentage
FROM sales;
```

### 6 Average Basket Size.
- How much does a customer spend on average per visit?

```
SELECT AVG(total_sale) AS avg_transaction_value
FROM sales;
```