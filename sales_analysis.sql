-- ============================================
-- Sales Performance Analysis - SQL Queries
-- Dataset: 1000 transactions | Year: 2023-2024
-- Author: Saravana Kumar
-- ============================================

-- 1. TOTAL REVENUE OVERVIEW
SELECT 
    COUNT(Transaction_ID) AS Total_Transactions,
    SUM(Total_Amount) AS Total_Revenue,
    AVG(Total_Amount) AS Avg_Order_Value,
    SUM(Quantity) AS Total_Units_Sold
FROM sales_performance;

-- 2. REVENUE BY PRODUCT CATEGORY
SELECT 
    Product_Category,
    COUNT(*) AS Total_Orders,
    SUM(Quantity) AS Units_Sold,
    SUM(Total_Amount) AS Revenue,
    ROUND(SUM(Total_Amount) * 100.0 / (SELECT SUM(Total_Amount) FROM sales_performance), 2) AS Revenue_Pct
FROM sales_performance
GROUP BY Product_Category
ORDER BY Revenue DESC;

-- 3. MONTHLY REVENUE TREND
SELECT 
    STRFTIME('%Y-%m', Date) AS Month,
    COUNT(*) AS Orders,
    SUM(Total_Amount) AS Monthly_Revenue,
    SUM(Quantity) AS Units_Sold
FROM sales_performance
GROUP BY STRFTIME('%Y-%m', Date)
ORDER BY Month;

-- 4. GENDER-WISE SALES ANALYSIS
SELECT 
    Gender,
    COUNT(*) AS Total_Orders,
    SUM(Total_Amount) AS Total_Revenue,
    ROUND(AVG(Age), 1) AS Avg_Age,
    SUM(Quantity) AS Units_Sold
FROM sales_performance
GROUP BY Gender;

-- 5. AGE GROUP SEGMENTATION
SELECT 
    CASE 
        WHEN Age BETWEEN 18 AND 25 THEN '18-25'
        WHEN Age BETWEEN 26 AND 35 THEN '26-35'
        WHEN Age BETWEEN 36 AND 45 THEN '36-45'
        WHEN Age BETWEEN 46 AND 55 THEN '46-55'
        ELSE '56+' 
    END AS Age_Group,
    COUNT(*) AS Customers,
    SUM(Total_Amount) AS Revenue,
    SUM(Quantity) AS Units_Sold
FROM sales_performance
GROUP BY Age_Group
ORDER BY Revenue DESC;

-- 6. TOP 10 HIGH-VALUE TRANSACTIONS
SELECT 
    Transaction_ID,
    Customer_ID,
    Gender,
    Age,
    Product_Category,
    Quantity,
    Total_Amount
FROM sales_performance
ORDER BY Total_Amount DESC
LIMIT 10;

-- 7. CATEGORY PERFORMANCE BY GENDER
SELECT 
    Product_Category,
    Gender,
    COUNT(*) AS Orders,
    SUM(Total_Amount) AS Revenue,
    ROUND(AVG(Total_Amount), 2) AS Avg_Order
FROM sales_performance
GROUP BY Product_Category, Gender
ORDER BY Product_Category, Revenue DESC;

-- 8. CUSTOMER PURCHASE FREQUENCY
SELECT 
    Customer_ID,
    COUNT(*) AS Purchase_Count,
    SUM(Total_Amount) AS Total_Spent,
    MAX(Total_Amount) AS Max_Single_Purchase
FROM sales_performance
GROUP BY Customer_ID
HAVING COUNT(*) > 1
ORDER BY Total_Spent DESC
LIMIT 10;

-- 9. BEST PERFORMING MONTH PER CATEGORY
SELECT 
    Product_Category,
    STRFTIME('%Y-%m', Date) AS Best_Month,
    SUM(Total_Amount) AS Revenue
FROM sales_performance
GROUP BY Product_Category, STRFTIME('%Y-%m', Date)
ORDER BY Product_Category, Revenue DESC;

-- 10. REVENUE QUARTILE ANALYSIS (High/Mid/Low performers)
SELECT 
    CASE 
        WHEN Total_Amount >= 400 THEN 'High Value'
        WHEN Total_Amount BETWEEN 200 AND 399 THEN 'Mid Value'
        ELSE 'Low Value'
    END AS Order_Segment,
    COUNT(*) AS Order_Count,
    SUM(Total_Amount) AS Segment_Revenue,
    ROUND(AVG(Total_Amount), 2) AS Avg_Order_Value
FROM sales_performance
GROUP BY Order_Segment
ORDER BY Segment_Revenue DESC;
