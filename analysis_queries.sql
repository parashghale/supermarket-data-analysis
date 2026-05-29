-- =============================================
-- SUPERMARKET DATA ANALYSIS
-- Author: Parash Ghale
-- Tools: MySQL 8.0
-- =============================================

-- Q1: Products needing reorder
SELECT p.product_name, w.quantity, w.reorder_level
FROM products p
JOIN warehouse_stock w ON p.product_id = w.product_id
WHERE w.quantity < w.reorder_level
ORDER BY w.quantity;

-- Q2: Total stock value per category
SELECT c.category_name,
       SUM(p.unit_price * w.quantity) as total_value
FROM products p
JOIN categories c ON p.category_id = c.category_id
JOIN warehouse_stock w ON p.product_id = w.product_id
GROUP BY c.category_name
ORDER BY total_value DESC;

-- Q3: Top 5 customers by spending
SELECT c.first_name, c.last_name,
       SUM(o.total_amount) as total_spent
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
WHERE o.status = 'Completed'
GROUP BY c.customer_id
ORDER BY total_spent DESC
LIMIT 5;

-- Q4: Monthly sales report
SELECT MONTHNAME(order_date) as month,
       COUNT(*) as total_orders,
       SUM(total_amount) as revenue,
       AVG(total_amount) as avg_order_value
FROM orders
WHERE status = 'Completed'
GROUP BY MONTHNAME(order_date)
ORDER BY MIN(order_date);

-- Q5: Stock value by category labeled HIGH/LOW
WITH cat_value AS (
    SELECT c.category_name,
           SUM(w.quantity * p.unit_price) as total_value
    FROM categories c
    JOIN products p ON c.category_id = p.category_id
    JOIN warehouse_stock w ON p.product_id = w.product_id
    GROUP BY c.category_name
)
SELECT category_name, total_value,
       CASE WHEN total_value > 50000 THEN 'HIGH'
            ELSE 'LOW'
       END as label
FROM cat_value
ORDER BY total_value DESC;

-- "Give a monthly sales report — total orders, total revenue and average order value for each month"

select sum(total_amount) from orders where status ='completed';
select monthname(order_date)as month,count(*) as totalNo,sum(total_amount) as totalAmt
	,avg(total_amount) average
from orders where status='completed'
group by monthname(order_date);

-- "Which department has the highest total salary cost?"
select department, sum(salary) as totalSalary
	,rank() over(order by sum(salary) desc)
from employees group by department;

