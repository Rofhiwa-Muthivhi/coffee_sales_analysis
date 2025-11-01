--Exploring data types per column.
SELECT *
FROM Bright.Coffee.Sales
LIMIT 10;

--Opening time.
SELECT MIN(transaction_time) AS Opening_time
FROM Bright.Coffee.Sales;

-- First day of operation.
SELECT MIN(transaction_date) AS First_operating_date
FROM Bright.Coffee.Sales;

-- Closing time.
SELECT MAX(transaction_time) AS Closing_time
FROM Bright.Coffee.Sales;


-- Last day of operation.
SELECT MAX(transaction_date) AS Last_operating_date
FROM Bright.Coffee.Sales;


-- Days and months difference to see days and months operated.
SELECT DATEDIFF(DAY,'2023-01-30','2023-06-30') AS Days_operated,
       DATEDIFF(MONTH,'2023-01-01','2023-06-30') AS Months_operated
FROM Bright.Coffee.Sales; -- Dataset is only fixed for the months January - June.


-- Finding all unique Product_categories in my dataset.
SELECT DISTINCT Product_Category
FROM Bright.Coffee.Sales;


-- Finding all unique Product_Types in my dataset.
SELECT DISTINCT Product_type
FROM Bright.Coffee.Sales;


-- Finding all unique Product details.
SELECT DISTINCT Product_detail
FROM Bright.Coffee.Sales;


--I want to count number of sales, number of unique products and Number of shops.
SELECT COUNT(DISTINCT transaction_id) AS Number_of_sales,
       COUNT(DISTINCT product_id) AS Number_of_unique_products,
       COUNT(DISTINCT store_id) AS Number_of_shops
FROM Bright.Coffee.Sales;


-- Revenue calculations and date conversions.
SELECT Transaction_id,
       Transaction_date,
       Transaction_time,
       Store_id,
       Store_location,
       Product_id,
       Product_type,
       Product_category,
       Product_detail,
       Unit_price,
       Transaction_qty * unit_price AS Revenue,
       DAYNAME(TO_DATE(transaction_date)) AS Day_name,
       MONTHNAME(TO_DATE(transaction_date)) AS Month_name,
       TO_CHAR(TO_DATE(transaction_date), 'YYYYMM') AS Month_id,
       HOUR(Transaction_time) AS Hour_of_day,
       
-- Creating time buckets
       CASE
            WHEN transaction_time BETWEEN '06:00:00' AND '11:59:59' THEN '01. Morning'
            WHEN transaction_time BETWEEN '12:00:00' AND '15:59:59' THEN '02. Afternoon'
            WHEN transaction_time BETWEEN '16:00:00' AND '19:59:59' THEN '03. Evening'
            WHEN transaction_time >= '20:00:00'  THEN '04. Night'
        END AS Time_bucket
FROM Bright.Coffee.Sales

WHERE transaction_date  BETWEEN '2023-01-01' AND '2023-06-30';


    
        

   
    
      

         