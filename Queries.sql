-- Retrieve the total numbers of orders placed : 
select count(*) from orders as Total_Numbers_Of_Orders;


-- Calculate the total revenue generated from pizza sales.
select sum(od.quantity * p.price) as Total_Revenue
from order_details od 
join pizzas p on od.pizza_id = p.pizza_id;


-- Identify the highest-priced pizza.
select pt.name,p.price from 
pizza_types pt join
pizzas p on pt.pizza_type_id = p.pizza_type_id
order by p.price desc limit 1;


-- Identify the most common pizza size ordered.
select p.size as Pizza_Size, sum(od.quantity) as Total_Order 
from pizzas p 
join order_details od on p.pizza_id = od.pizza_id
group by p.size 
order by total_order desc limit 1;


-- List the top 5 most ordered pizza types along with their quantities.
select  pt.name as Pizza_Name , sum(od.quantity) as Quantity 
from order_details od 
join pizzas p on od.pizza_id = p.pizza_id
join pizza_types pt on p.pizza_type_id = pt.pizza_type_id
group by Pizza_Name
order by Quantity
desc limit 5;



-- find the total quantity of each pizza category ordered.
select pt.category as Category , sum(od.quantity) as TotalQuantity
from order_details od 
join pizzas p on p.pizza_id = od.pizza_id
join pizza_types pt on pt.pizza_type_id = p.pizza_type_id
group by Category
order by TotalQuantity desc;


-- Determine the distribution of orders by hour of the day.
select extract(hour from time) as Hour,
count(*) as Total_Orders
from orders
group by Hour
order by Hour;


-- find the category-wise distribution of pizzas.
select pt.category as Category , count(*) as total_orders
from order_details od 
join pizzas p on od.pizza_id = p.pizza_id
join pizza_types pt on p.pizza_type_id = pt.pizza_type_id
group by Category
order by total_orders desc;


-- Average number of pizzas ordered per day
select round(avg(daily_total)) as avg_pizzas_per_day
from (
	select o.date,sum(od.quantity)as daily_total
	from orders o 
	join order_details od on o.order_id = od.order_id
	group by o.date
) as daily_orders


-- Top 3 most ordered pizza types based on revenue
select pt.name , sum(od.quantity*p.price) as revenue
from order_details od 
join pizzas p on od.pizza_id = p.pizza_id
join pizza_types pt on p.pizza_type_id = pt.pizza_type_id
group by pt.name
order by revenue desc
limit 3;


-- Percentage contribution of each pizza type to total revenue
select pt.name,sum(od.quantity * p.price) as revenue,
round(
		sum(od.quantity * p.price) * 100.0/
		sum(sum(od.quantity*p.price)) over(),
		2
	)as percentage_contribution
from order_details od
join pizzas p on od.pizza_id = p.pizza_id
join pizza_types pt on p.pizza_type_id = pt.pizza_type_id
group by pt.name
order by percentage_contribution desc;


-- Cumulative revenue over time
SELECT daily_data.date,
       SUM(daily_data.daily_revenue) OVER (ORDER BY daily_data.date) AS cumulative_revenue
FROM (
    SELECT o.date,
           SUM(od.quantity * p.price) AS daily_revenue
    FROM orders o
    JOIN order_details od ON o.order_id = od.order_id
    JOIN pizzas p ON od.pizza_id = p.pizza_id
    GROUP BY o.date
) AS daily_data
ORDER BY daily_data.date;


-- Top 3 pizzas by revenue within each category
WITH ranked_pizzas AS (
    SELECT pt.category,
           pt.name,
           SUM(od.quantity * p.price) AS revenue,
           RANK() OVER (
               PARTITION BY pt.category
               ORDER BY SUM(od.quantity * p.price) DESC
           ) AS rank
    FROM order_details od
    JOIN pizzas p ON od.pizza_id = p.pizza_id
    JOIN pizza_types pt ON p.pizza_type_id = pt.pizza_type_id
    GROUP BY pt.category, pt.name
)

SELECT category, name, revenue
FROM ranked_pizzas
WHERE rank <= 3;