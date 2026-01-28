


CREATE TABLE Retail_sales(
   transactions_id int,
sale_date DATE,
sale_time TIME,
customer_id INT,
gender VARCHAR(10),
age INT,
category VARCHAR(10)
quantiy INT,
price_per_unit INT,
cogs INT,
total_sale INT
)

ALTER table Retail_sales
r quantiy to quantity;

select
	count(*)
from  Retail_sales;

SELECT * FROM Retail_sales;


SELECT * from Retail_sales
WHERE 
	transactions_id IS NULL
	OR 
	sale_date IS NULL 
	OR 
	sale_time IS NULL
	OR 
	gender IS NULL 
	OR 
	category IS NULL
	OR 
	cogs IS NULL
	OR 
	total_sale IS NULL

DELETE FROM Retail_sales
WHERE 
	transactions_id IS NULL
	OR 
	sale_date IS NULL 
	OR 
	sale_time IS NULL
	OR 
	gender IS NULL 
	OR 
	category IS NULL
	OR 
	cogs IS NULL
	OR 
	total_sale IS NULL;

SELECT COUNT(*) FROM Retail_sales;

SELECT count(DISTINCT customer_id) as total_sale FROM Retail_sales;

SELECT DISTINCT category FROM Retail_sales;

-- Data Analysis


SELECT count(*)	
FROM Retail_sales
WHERE sale_date = '2022-11-05';


SELECT *
FROM Retail_sales
WHERE category = 'Clothing'
  AND sale_date >= '2022-11-01'
  AND sale_date <  '2022-12-01'
  AND quantity >= 4;

SELECT * FROM
(
	SELECT 
	     EXTRACT(YEAR FROM sale_date) as year,
		 EXTRACT(MONTH FROM sale_date) as month,
		 AVG(total_sale) as avg_sale,
		 RANK() OVER(PARTITION BY EXTRACT(YEAR FROM sale_date) ORDER BY AVG(total_sale)DESC) as rank
	    GROUP by 1,2
) as t1
WHERE rank = 1


SELECT customer_id,
	SUM(total_sale) as total_sale
FROM Retail_sales
GROUP BY customer_id
ORDER BY total_sale DESC
LIMIT 5;



SELECT category,
	COUNT(DISTINCT customer_id) as uniqe_cust
FROM Retail_sales
GROUP BY category


WITH sales as
(
SELECT *,
    CASE 
		WHEN EXTRACT(HOUR FROM sale_time) < 12 THEN 'morning'
	 	WHEN EXTRACT(HOUR FROM sale_time) BETWEEN 12 AND 17 THEN 'afternoon'
	 	ELSE 'evening'
	END as shift
FROM Retail_sales
)

SELECT shift,
		COUNT(*) as total_orders
FROM sales
GROUP BY shift





