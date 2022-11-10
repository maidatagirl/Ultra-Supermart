--create sales table--
create table if not exists Sales(
	sales_id int primary key,
	order_id int,
	order_date date,
	order_priority char(30),
	order_quantity int,
	sales decimal(8,3),
	discount decimal(8,3),
	ship_mode char(30),
	profit decimal(8,3),
	unit_price decimal(8,3),
	shipping_cost decimal(8,3),
	first_name char(30),
	last_name char(30),
	region char(30),
	customer_segment char(30),
	product_category char(40),
	product_subcategory char(40),
	product_container char(40),
	ship_date date,
	birth_date date
);


--load data into table using copy command method--
copy Sales
from 'C:\Program Files\PostgreSQL\sales(ultra supermart).csv' csv header delimiter ','


create table if not exists RegionalManager(
	region char(30),
	manager char(30)
);

--load data using copy command method--
copy RegionalManager
from 'C:\Program Files\PostgreSQL\regional_manager(ultra supermart).csv' csv header delimiter ','


create table if not exists ReturnedItem(
	id int,
	Order_id int,
	sales_id int,
	order_status char(35)
);


--load data using copy comand method--
copy ReturnedItem
from 'C:\Program Files\PostgreSQL\returned_item(ultra supermart).csv' csv header delimiter ','

select *
from ReturnedItem;


/*The Organization is planning to gift the best performing manager
who made the best sales and want to know the region 
which the manager belongs to?*/

select 
	r.manager,
	r.region,
	round(sum(sales)) as total_sales
from Sales s
join RegionalManager r
on s.region = r.region
group by 1,2
order by 3 desc
limit 1;

 

--how many times was delivery truck used as the ship mode?--
select distinct
	ship_mode,
	count(ship_mode)
from Sales
group by 1
having ship_mode = 'Delivery Truck';


/*how many orders were returned,
and which product category got rejected the most?*/
select distinct count(order_status),
	s.product_category,
	r.order_status,
	count(order_status) as returnedorders
from ReturnedItem r
join Sales s
on r.sales_id = s.sales_id
group by 2,3
having order_status = 'Returned'
order by 4 desc;

select distinct count(order_status)
from ReturnedItem
where order_status = 'Returned';

--which Year did the company incurred the least shipping cost?--
select 
	date_part('year', ship_date) as ship_year,
	round(sum(shipping_cost)) as ship_cost
from  Sales
group by 1
order by 2 asc
limit 1;


--display the day of the week in which customer segment has the most sales?--
select 
	customer_segment,
	to_char(order_date, 'Day'),
	round(sum(sales)) as total_sales
from Sales
group by 1,2
order by 3 desc
limit 1;


/*The company want to determine its profitability by
knowing the actual orders that were delivered.*/
select distinct
	r.order_status,
	round(sum(profit)) as profit
from ReturnedItem r
join Sales s
on r.order_id = s.order_id
group by 1
having r.order_status = 'Delivered'



/*The Organization is eager to know the 
customer names and persons born in 2011?*/
select 
	concat(first_name,' ',last_name) as full_name
from Sales
where date_part('year', birth_date) = '2011';



--what are the aggregate orders made by all the customers?--
select 
	--concat(first_name, ' ', last_name) as full_name,
	sum(order_quantity) as total_orders
from Sales;
--group by 1
--order by 2 desc;

/*The company intends to discontinue any product 
that brings in the least profit,
you are required to help the organization to determine the product?*/

select 
	product_subcategory,
	--product_category,
	round(sum(profit)) as profit
from Sales
group by 1
order by 2 asc
limit 5;

--what are the top 2 best selling items that the company should keep selling?
select 
	--product_category,
	product_subcategory,
	round(sum(profit)) as profit
	--sum(order_quantity) as order_quantity
from sales
group by 1
order by 2 desc 
limit 2;







































