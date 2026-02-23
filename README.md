# ELEVATE_LABS-Task-6-sales-analysis.sql
SQL script for analyzing monthly revenue and order volume using aggregations.

##  📊 Sales Trend Analysis Using SQL Aggregations 💡

**Objective**:  
Analyze monthly revenue 💰 and order volume 📦 using SQL aggregations.

**Tools**:  
PostgreSQL/MySQL/SQLite 🛠️

## 📁 Files Uploaded:
- **SQL Script**: `ELEVATE_LABS-Task-6-sales-analysis.sql`
- **Datasets**: `orders.csv`, `products.csv`
- **Results**: Screenshots like `Q1.jpg`, `orders-Data_Review.jpg`
- **Task PDF**: `TASK 6 DA.pdf`
- **README**: Task details and interview questions.

## Steps to Achieve This 📈:
- Extracted **month** and **year** from `order_date`.
- Grouped data by **year** and **month**.
- Calculated **monthly revenue** using `SUM(amount)` 💵.
- Calculated **order volume** using `COUNT(DISTINCT order_id)` 📦.
- Sorted the results with `ORDER BY` for a time-series view 📅.

## 🎓 Interview Questions:
1. **How do you group data by month and year?**  
   Use `EXTRACT(YEAR FROM order_date)` and `EXTRACT(MONTH FROM order_date)` to group data.

2. **What's the difference between `COUNT(*)` and `COUNT(DISTINCT col)`?**  
   `COUNT(*)` counts all rows (including duplicates), while `COUNT(DISTINCT col)` counts unique values only.

3. **How do you calculate monthly revenue?**  
   Use `SUM(amount)` grouped by month to calculate revenue.

4. **What are aggregate functions in SQL?**  
   Functions like `SUM()`, `COUNT()`, `AVG()`, etc., that perform calculations on multiple rows and return a single result.

5. **How to handle NULLs in aggregates?**  
   NULL values are ignored in most aggregates, but use `COALESCE()` to replace them with default values if needed.

6. **What’s the role of `ORDER BY` and `GROUP BY`?**  
   `GROUP BY` groups data, while `ORDER BY` sorts the result set.

7. **How do you get the top 3 months by sales?**  
   Use `ORDER BY revenue DESC LIMIT 3` to fetch the top 3 months with the highest revenue.

---

## Author

[Mihir Sonar](https://www.linkedin.com/in/mihir-sonar-2287041bb)

[![LinkedIn Badge](https://img.shields.io/badge/LinkedIn-blue?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/mihir-sonar-2287041bb)

---

🎉 **Task Completed!** Your analysis is now ready to be submitted. 📤

