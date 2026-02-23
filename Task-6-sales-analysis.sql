Create Database sales_analysis;
use sales_analysis;

# To View Orders Dataset

select * from orders;

# To View Products Datases

select * from products;

DESCRIBE orders;



/* Analyze Monthly Revenue & Order Volume 
# Q1. Basic Aggregation Query */

select 
Year(str_to_date(order_date,'%Y-%m-%d')) As year,
Month(str_to_date(order_date, '%Y-%m-%d')) As month,
Sum(total_price) As monthly_revenue,
count(distinct order_id) As order_volume
From
orders
Group By
Year(str_to_date(order_date, '%Y-%m-%d')),
 Month(str_to_date(order_date, '%Y-%m-%d'))
Order By
year, month;


# Q2. Filter for a Specific Year (e.g., 2023)

Select
Year(str_to_date(order_date, '%Y-%m-%d')) As year,
Month(str_to_date(order_date, '%Y-%m-%d')) As month,
Sum(total_price) as monthly_revenue,
Count(distinct order_id) As order_volume
From
orders
Where
Year(str_to_date(order_date, '%Y-%m-%d')) = 2023
Group By 
Year(str_to_date(order_date, '%Y-%m-%d')),
Month(str_to_date(order_date, '%Y-%m-%d'))
Order By
month;

# Q3. Top 3 Months by Revenue (Across All Years)

Select
Year(str_to_date(order_date, '%Y-%m-%d')) As Year,
Month(str_to_date(order_date, '%Y-%m-%d')) As month,
Sum(total_price) As monthly_revenue
From
orders
Group By
Year(str_to_date(order_date, '%Y-%m-%d')),
Month(str_to_date(order_date, '%Y-%m-%d'))
Order By
monthly_revenue Desc
Limit 3;


# Q4. BONUS – Combine Month Name for Better Labels

SELECT 
DATE_FORMAT(STR_TO_DATE(order_date, '%d-%m-%Y'), '%Y-%m'), 
SUM(total_price), 
COUNT(DISTINCT order_id) 
FROM orders
 GROUP BY
 DATE_FORMAT(STR_TO_DATE(order_date, '%d-%m-%Y'), '%Y-%m') 
 ORDER BY
 DATE_FORMAT(STR_TO_DATE(order_date, '%d-%m-%Y'), '%Y-%m');

# Q5. Monthly Revenue and Order Volume (Using EXTRACT)

SELECT 
  EXTRACT(YEAR FROM STR_TO_DATE(order_date, '%d-%m-%Y')) AS year,
  EXTRACT(MONTH FROM STR_TO_DATE(order_date, '%d-%m-%Y')) AS month,
  SUM(total_price) AS monthly_revenue,
  COUNT(DISTINCT order_id) AS order_volume
FROM 
  orders
GROUP BY 
  EXTRACT(YEAR FROM STR_TO_DATE(order_date, '%d-%m-%Y')),
  EXTRACT(MONTH FROM STR_TO_DATE(order_date, '%d-%m-%Y'))
ORDER BY 
  year, month;


# Q6. Monthly Revenue for a Specific Year (Hint f)

SELECT 
  EXTRACT(MONTH FROM STR_TO_DATE(order_date, '%d-%m-%Y')) AS month,
  SUM(total_price) AS monthly_revenue
FROM 
  orders
WHERE 
  EXTRACT(YEAR FROM STR_TO_DATE(order_date, '%d-%m-%Y')) = 2023
GROUP BY 
  EXTRACT(MONTH FROM STR_TO_DATE(order_date, '%d-%m-%Y'))
ORDER BY 
  month;


# Q7. Total Revenue & Orders by Day

SELECT 
  STR_TO_DATE(order_date, '%d-%m-%Y') AS order_day,
  SUM(total_price) AS total_revenue,
  COUNT(DISTINCT order_id) AS order_volume
FROM 
  orders
GROUP BY 
  STR_TO_DATE(order_date, '%d-%m-%Y')
ORDER BY 
  order_day;


# Q8. Top 5 Highest Revenue Days

SELECT 
  STR_TO_DATE(order_date, '%d-%m-%Y') AS order_day,
  SUM(total_price) AS revenue
FROM 
  orders
GROUP BY 
  STR_TO_DATE(order_date, '%d-%m-%Y')
ORDER BY 
  revenue DESC
LIMIT 5;



# Q9. Revenue per Product (Joined with products table)

SELECT 
  p.product_name,
  SUM(o.total_price) AS total_revenue,
  COUNT(o.order_id) AS total_orders
FROM 
  orders o
JOIN 
  products p ON o.product_id = p.product_id
GROUP BY 
  p.product_name
ORDER BY 
  total_revenue DESC;


# Q10. Create a View for Reuse

CREATE VIEW monthly_sales_summary AS
SELECT 
  DATE_FORMAT(STR_TO_DATE(order_date, '%d-%m-%Y'), '%Y-%m'),
  SUM(total_price),
  COUNT(DISTINCT order_id)
FROM 
  orders
GROUP BY 
  DATE_FORMAT(STR_TO_DATE(order_date, '%d-%m-%Y'), '%Y-%m');
  
  SELECT * FROM monthly_sales_summary;





































































