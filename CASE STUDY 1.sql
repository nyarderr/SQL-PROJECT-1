-- Create tables --

create table fact (date date, Product_id int, Profit int, sales int, margin int, COGS int, Total_expenses int, Marketing int, inventory int, budget_profit int, budget_COGS int,
Budget_margin int, Budget_sales int, Area_code bigint);
create table location(Area_code bigint, state varchar, market varchar, market_size varchar)
create table product (product_id int primary key, product_type varchar, product_name varchar, type varchar)

-- Insert values from csv file into respective tables --
copy fact from 'C:\Program Files\PostgreSQL\17\data\fact.csv' delimiter ',' csv header
copy location from 'C:\Program Files\PostgreSQL\17\data\Location.csv' delimiter ',' csv header
copy product from 'C:\Program Files\PostgreSQL\17\data\product.csv' delimiter ',' csv header

SELECT * FROM product
SELECT * FROM fact
SELECT * FROM location

-- CASE STUDY 1 --
/* How many products are of regular type ? */
SELECT count(*) AS RegularProduct FROM product WHERE type = 'Regular'

-- Display the average inventory for each product id -- 
SELECT productid, avg(inventory) AS AvergaeInventory 
FROM fact 
GROUP BY productid

-- Display state in a sequential order in a location table --
SELECT state 
FROM location 
ORDER BY state ASC;

/* Display the average budget margin of the store where average budget margin
should be greater than 100 */
SELECT avg(budget_margin) AS AverageBudgetMargin
FROM fact
HAVING avg(budget_margin)> 100;

-- What is the total sales done on date 2010-01-01 --
SELECT sum(sales) AS TotalSales
FROM fact
WHERE date = '2010-01-01';

--Display the average total expense of each product id on individual date--
SELECT productid, date, avg(total_expenses) AS AverageTotalExpense
FROM fact
GROUP BY productid,date;

/* Display the table with the following attributes such as Date, productid,
product_type, product, Sales, profit, state, area_code */
CREATE TABLE temp AS SELECT
	fact.date,
	fact.productid,
	fact.area_code,
	fact.sales,
	fact.profit,
	product.product_type,
	product.product
	FROM fact 
	INNER JOIN product
	ON fact.productid = product.productid

SELECT * from temp
create table temp_2 AS SELECT 
	temp.date,
	temp.productid,
	temp.area_code,
	temp.sales,
	temp.profit,
	temp.product_type,
	temp.product,
	location.state 
	FROM temp
	INNER JOIN location
	ON temp.area_code=location.area_code
	
-- Display the rank without any gap to show the Sales wise rank --
SELECT Product_id, Sales,
       RANK() OVER (ORDER BY Sales DESC) AS SalesRank
FROM fact;

-- Find the State wise Profit and Sales --
Select state, 
	sum(profit) AS TotalProfit,
	sum(sales) AS TotalSales
	FROM temp_2
	GROUP BY state;
	
-- If there is an increase in sales of 5%. Calculate the increased sales --
select * from fact
SELECT sales, sales * 1.05 AS "Increased Sales" from fact

-- Find the maximum profit along with the Product id and Product Type --
select * from temp_2

SELECT productid, product_type,
	MAX(profit) AS "Maximum Profit"
	FROM temp_2
	GROUP BY productid, product_type
	ORDER BY productid;

/* Create a Stored Procedure to fetch the result according to the product type from
Product */
CREATE OR REPLACE PROCEDURE GetProductsByType(IN prod_type VARCHAR)
LANGUAGE plpgsql
AS $$
BEGIN
    SELECT * FROM product WHERE Product_Type = prod_type;
END;
$$;

/* Write a query by creating a condition in which if the total expenses is less than
60 then it is a profit or else loss */
SELECT *,
	CASE WHEN total_expenses < 60 THEN 'Profit'
	ELSE 'Loss'
	END AS "Profit/Loss"
	FROM fact
	
/* Give the total weekly sales value with the Date and productid details. Use
roll-up to pull the data in hierarchical order */

SELECT DATE_TRUNC('week', Date) AS Week, Product_id, SUM(Sales) AS TotalWeeklySales
FROM fact
GROUP BY ROLLUP (DATE_TRUNC('week', Date), Product_id);


/* Apply union and intersection operator on the tables which consist of attribute
area code */

SELECT  area_code from location
INTERSECT
SELECT area_code FROM fact

SELECT  area_code from location
UNION
SELECT area_code FROM fact

-- Change the product type from coffee to tea where product id is 1 and undo it --
SELECT * from product

UPDATE product
SET product = 'tea' 
WHERE product_type = 'Coffee' AND productid = 1

UPDATE product
SET product = 'Coffee'
WHERE productid = 1

/* Display the Date, productid and sales where total expenses are between 100 to
200 */

SELECT * FROM fact

SELECT date, productid, sales
FROM fact
WHERE total_expenses BETWEEN 100 and 200;









