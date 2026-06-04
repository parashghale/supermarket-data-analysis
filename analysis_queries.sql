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

-- "Who are our top 5 customers by total spending?"
select * from customers;
select c.customer_id,sum(o.total_amount) as totalamt, c.first_name,c.last_name
	, c.email,c.loyalty_tier 
from customers c join
orders o on c.customer_id=o.customer_id where o.status ='completed'
group by c.customer_id
order by sum(o.total_amount) desc limit 5;

-- "Who are our top 5 customers by total spending?"
select * from customers;
select c.customer_id,sum(o.total_amount) as totalamt, c.first_name,c.last_name
	, c.email,c.loyalty_tier
    , rank() over (order by sum(o.total_amount) desc) as ranking
from customers c join
orders o on c.customer_id=o.customer_id where o.status ='completed'
group by c.customer_id
limit 5;

-- "Show each customer, their total spending, and rank them within their loyalty tier"
select c.customer_id,sum(o.total_amount) as totalAmt, c.first_name,c.last_name
	, c.email,c.loyalty_tier, rank() over (order by SUM(o.total_amount) desc) as Ranking
from customers c join
orders o on c.customer_id=o.customer_id 
where status ='completed'
group by c.customer_id;

-- "Which employee has processed the most orders?"
select * from orders;
select * from employees;
select e.employee_id, e.first_name,e.last_name, e.department
,count(o.employee_id) as totalProcessed
from employees e join orders o on e.employee_id=o.employee_id
group by e.employee_id
order by totalProcessed desc;

-- "Show each customer, their total spending, and rank them within their loyalty tier"
select  c.customer_id,sum(o.total_amount) as totalAmt, c.first_name,c.last_name
	, c.email,c.loyalty_tier, RANK() OVER (PARTITION BY c.loyalty_tier 
             ORDER BY SUM(o.total_amount) DESC) as Ranking
from customers c join
orders o on c.customer_id=o.customer_id 
where o.status ='Completed' and c.loyalty_tier ='Platinum'
group by c.customer_id;


-- "Show employees who processed above average number of orders"
select * from employees;
select * from orders;
with avge as (
	select count(employee_id) as avgemp from orders
    group by employee_id
)
select e.first_name, a.avgemp from employees e 
join avge a on e.employee_id= a.employee_id
group by e.first_name having e.first_name > a.avgemp;

select count(*), avg(employee_id) as avgemp from orders
    group by employee_id
;
with count_emp as (
	select count(*) as ttl, employee_id from orders group by employee_id
),
avg_count as (
	select avg(ttl) as avg_counts from count_emp
)
select e.first_name, c.ttl, a.avg_counts from employees e 
join count_emp c on e.employee_id = c.employee_id, avg_count a
 order by c.ttl desc
;
