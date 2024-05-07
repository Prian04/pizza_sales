create database pizza_db;
use pizza_db;

-- total revenue
select sum(total_price) as Total_revenue from pizza_sales;

-- average order sales
SELECT (SUM(total_price) / COUNT(DISTINCT order_id)) AS Avg_order_Value FROM pizza_sales;

-- total pizza sold
SELECT SUM(quantity) AS Total_pizza_sold FROM pizza_sales;

-- Total Orders
SELECT COUNT(DISTINCT order_id) AS Total_Orders FROM pizza_sales;

-- Average pizza per order
SELECT CAST(CAST(SUM(quantity) AS DECIMAL(10,2)) /  CAST(COUNT(DISTINCT order_id) AS DECIMAL(10,2)) AS DECIMAL(10,2)) AS Avg_Pizzas_per_order FROM pizza_sales;

-- Daily Trends for total orders
SELECT DAYNAME(STR_TO_DATE(order_date, '%d-%m-%Y')) AS order_day, COUNT(DISTINCT order_id) AS total_orders
FROM pizza_sales
GROUP BY DAYNAME(STR_TO_DATE(order_date, '%d-%m-%Y'));

-- Month trend for orders
SELECT MONTHNAME(STR_TO_DATE(order_date, '%d-%m-%Y')) AS Month_Name, COUNT(DISTINCT order_id) AS Total_Orders
FROM pizza_sales
GROUP BY MONTHNAME(STR_TO_DATE(order_date, '%d-%m-%Y'));

-- Percentage of sales by pizza category
Select pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue, CAST(sum(total_price) * 100 / (Select sum(total_price) from pizza_sales Where DATE_FORMAT(STR_TO_DATE(order_date, '%d-%m-%Y'), '%m')  = 1) AS DECIMAL(10,2)) As PCT from pizza_sales Where DATE_FORMAT(STR_TO_DATE(order_date, '%d-%m-%Y'), '%m')  = 1 GROUP BY pizza_category;

SELECT pizza_category, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_category;

-- Percentage of sales by pizza size
SELECT pizza_size, CAST(SUM(total_price) AS DECIMAL(10,2)) as total_revenue,
CAST(SUM(total_price) * 100 / (SELECT SUM(total_price) from pizza_sales) AS DECIMAL(10,2)) AS PCT
FROM pizza_sales
GROUP BY pizza_size;

-- Total pizza sold by pizza category
SELECT pizza_category, SUM(quantity) as Total_Quantity_Sold
FROM pizza_sales
GROUP BY pizza_category
ORDER BY Total_Quantity_Sold DESC;

-- Total Revenue
SELECT  pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC;

-- Top 5 pizza total revenue
SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue DESC
LIMIT 5;

-- Bottom 5 pizza total revenue
SELECT pizza_name, SUM(total_price) AS Total_Revenue
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Revenue ASC
LIMIT 5;

-- Top 5 pizza total quantity
SELECT pizza_name, SUM(quantity) AS Total_Quantity
FROM pizza_sales
GROUP BY pizza_name
ORDER BY Total_Quantity DESC
LIMIT 5;
select * from pizza_sales;