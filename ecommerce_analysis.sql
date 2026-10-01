CREATE DATABASE ecommerce_sales;
USE ecommerce_sales;
CREATE TABLE sales_data (
    Order_ID VARCHAR(20),
    Order_Date DATE,
    Customer_ID VARCHAR(20),
    Customer_Name VARCHAR(100),
    Product VARCHAR(50),
    Category VARCHAR(50),
    Quantity INT,
    Unit_Price DECIMAL(10,2),
    Discount DECIMAL(5,2),
    Sales DECIMAL(12,2),
    Cost DECIMAL(12,2),
    Profit DECIMAL(12,2),
    City VARCHAR(50),
    State VARCHAR(50),
    Payment_Mode VARCHAR(50),
    Order_Status VARCHAR(30)
);
SELECT COUNT(*) AS total_rows
FROM sales_data;
SELECT * 
FROM sales_data;
SELECT * FROM sales_data;
SELECT COUNT(*) AS total_rows
FROM sales_data;
TRUNCATE TABLE sales_data;
SELECT COUNT(*) AS total_rows
FROM sales_data;
SHOW VARIABLES LIKE 'local_infile';
SET GLOBAL local_infile = 1;
SHOW VARIABLES LIKE 'local_infile';
LOAD DATA LOCAL INFILE 'C:\Users\rohin\OneDrive\Desktop/Microsoft Excel Comma Separated Values File (.csv)'
INTO TABLE sales_data
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;
SELECT COUNT(*) AS total_rows
FROM sales_data;
SELECT *
FROM sales_data
LIMIT 10;
SELECT
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM sales_data;
SELECT
    Category,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM sales_data
GROUP BY Category
ORDER BY Total_Sales DESC;
SELECT
    City,
    SUM(Sales) AS Total_Sales
FROM sales_data
GROUP BY City
ORDER BY Total_Sales DESC;
SELECT
    Product,
    SUM(Sales) AS Total_Sales
FROM sales_data
GROUP BY Product
ORDER BY Total_Sales DESC;
SELECT
    Product,
    SUM(Profit) AS Total_Profit
FROM sales_data
GROUP BY Product
ORDER BY Total_Profit DESC;
SELECT
    Payment_Mode,
    COUNT(*) AS Total_Orders,
    SUM(Sales) AS Total_Sales
FROM sales_data
GROUP BY Payment_Mode
ORDER BY Total_Sales DESC;
SELECT
    Order_Status,
    COUNT(*) AS Total_Orders,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM sales_data
GROUP BY Order_Status
ORDER BY Total_Orders DESC;
SELECT
    Order_Status,
    COUNT(*) AS Total_Orders,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM sales_data
GROUP BY Order_Status
ORDER BY Total_Orders DESC;
SELECT
    DATE_FORMAT(Order_Date, '%Y-%m') AS Month,
    SUM(Sales) AS Total_Sales,
    SUM(Profit) AS Total_Profit
FROM sales_data
GROUP BY DATE_FORMAT(Order_Date, '%Y-%m')
ORDER BY Month;
SELECT
    Customer_ID,
    Customer_Name,
    SUM(Sales) AS Total_Sales
FROM sales_data
GROUP BY Customer_ID, Customer_Name
ORDER BY Total_Sales DESC
LIMIT 5;