-- How many sales transactions are available in the dataset?
select count(*) as total_transactions from fact_sales

-- What is the total sales generated?
select round(sum(sales),2) as total_sales
from fact_sales

-- calculate Total Profit?
select round(sum(profit),2) as total_profit
from fact_sales

-- calculate the Average Sales per Transaction?
select round(avg(sales),2) as avg_sales
from fact_sales

-- -- 7. Number of orders per year?
select d.year,count(*) as no_of_orders
from fact_sales f
left join dim_date d
on f.order_date = d.date
group by d.year
order by d.year

-- total sales per shipping mode?

select ship_mode,round(sum(sales)::numeric,2) as total_sales
from fact_sales
group by ship_mode
order by total_sales desc

-- Total sales by region?

select c.region,round(sum(sales),2) as total_sales
from fact_sales f
join dim_customer c
on f.customer_id = c.customer_id
group by c.region
order by total_sales desc

-- sales by product category ?
select c.region,p.category,round(sum(sales),2) as total_sales
from fact_sales f
join dim_product p
on f.product_id = p.product_id
join dim_customer c
on f.customer_id = c.customer_id
group by c.region,p.category
order by c.region,p.category desc

-- Customers who spent above the average ?
select c.customer_name,round(sum(f.sales),2) as customer_total
from fact_sales f
join dim_customer c
on f.customer_id = c.customer_id
group by c.customer_name
having sum(f.sales) > (
  	select avg(customer_sum) from (
	select sum(sales) as customer_sum 
	from fact_sales
	group by customer_id
)sub
)

--Products that sold below average?

select p.product_name,round(sum(f.sales),2) as product_total
from fact_sales f
join dim_product p
on f.product_id = p.product_id
group by p.product_name
having sum(f.sales) < (

select round(avg(product_sum),2)as prod_avg from (
	select product_id,round(sum(sales),2) as product_sum
	from fact_sales
	group by product_id
)sub
)
order by product_total asc
limit 10


--  top-selling product?
select p.product_name,round(sum(f.sales),2) as product_total
from fact_sales f
join dim_product p
on f.product_id = p.product_id
group by p.product_name
having sum(f.sales) > (

select round(avg(product_sum),2)as prod_avg from (
	select product_id,round(sum(sales),2) as product_sum
	from fact_sales
	group by product_id
)sub
)
order by product_total desc
limit 1

-- or
SELECT p.product_name,
       ROUND(SUM(f.sales)::numeric,2) AS product_total
FROM fact_sales f
JOIN dim_product p
ON f.product_id = p.product_id
GROUP BY p.product_name
ORDER BY product_total DESC
LIMIT 1;


-- running total
select order_date,sales,
sum(sales) over(order by order_date
rows between unbounded preceding and current row) as running_total
from fact_sales
order by order_date
limit 20


-- Rank customers by spend
SELECT c.customer_name,
       SUM(f.sales) AS total_spend,
       RANK() OVER (ORDER BY SUM(f.sales) DESC) AS spend_rank
FROM fact_sales f
JOIN dim_customer c ON f.customer_id = c.customer_id
GROUP BY c.customer_name
LIMIT 10;


-- with cte
with customer_totals as (
	select customer_id,sum(sales) as total_spend
	from fact_sales 
	group by customer_id
)
select c.customer_name,ct.total_spend
from customer_totals ct
join dim_customer c
on c.customer_id = ct.customer_id
order by ct.total_spend desc
limit 10

-- Top product per category ?

select category,product_name,total_sales from(
	select 
		p.category,p.product_name,sum(f.sales) as total_sales,
	rank() over(partition by p.category order by sum(f.sales)desc) 
	as ranks from fact_sales f
	join dim_product p
	on f.product_id = p.product_id
	group by p.category,p.product_name
)ranked
where ranks = 1


-- Sales by Sub-Category
select
    p.sub_category,
    round(sum(f.profit),2) as total_profit
from fact_sales f
join dim_product p
on f.product_id = p.product_id
group by p.sub_category
order by total_profit desc

-- products making a loss
select
    p.product_name,
    round(sum(f.profit),2) as total_profit
from fact_sales f
join dim_product p
on f.product_id = p.product_id
group by p.product_name
having sum(f.profit) < 0
order by total_profit

-- best sales month
select d.month_name,round(sum(f.sales),2) as total_sales
from fact_sales f
join dim_date d
on f.order_date = d.date
group by d.month,d.month_name
order by total_sales desc
limit 1

-- by quarter
select d.quarter,round(sum(f.sales),2) as total_sales
from fact_sales f
join dim_date d
on f.order_date = d.date
group by d.quarter
order by total_sales desc
limit 1

-- average number of days taken to ship an order
select round(avg(days_to_ship),2) as ship_day
from fact_sales

-- Which shipping mode is used most frequently?
select ship_mode,count(*) as total_orders
from fact_sales
group by ship_mode
order by total_orders desc


-- Which shipping mode generates the highest sales?
select ship_mode,round(sum(sales),2) as total_sales
from fact_sales
group by ship_mode
order by total_sales desc
limit 1


-- Which shipping mode generates the profit?
select ship_mode,round(sum(profit),2) as total_profit
from fact_sales
group by ship_mode
order by total_profit desc
limit 1

-- avg profit margin category
select
    p.category,
    round(avg(f.profit_margin) * 100, 2) as avg_profit_margin_percent
from fact_sales f
join dim_product p
on f.product_id = p.product_id
group by p.category
order by avg_profit_margin_percent desc


-- Who are the top 5 customers in each region?
with customer_sales as (
select
    c.region,
    c.customer_name,
    round(sum(f.sales),2) as total_sales,
    rank() over(
        partition by c.region
        order by (f.sales) desc
    ) as sales_rank
from fact_sales f
join dim_customer c
on f.customer_id = c.customer_id
group by c.region,c.customer_name
)

select *
from customer_sales
where sales_rank <=5


-- category gives the highest average discount?
SELECT
    p.category,
    ROUND(AVG(f.discount)*100,2) AS avg_discount_percent
FROM fact_sales f
JOIN dim_product p
ON f.product_id = p.product_id
GROUP BY p.category
ORDER BY avg_discount_percent DESC;


-- finding which specific sales transactions were 
-- above the average sale amount.
select order_id,sales from fact_sales
where sales > (
select avg(sales) from fact_sales
)
order by sales desc