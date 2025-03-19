-- create a table
CREATE TABLE Supermarket_sales (
    Invoice_ID VARCHAR(50),
    Branch VARCHAR(10),
    City VARCHAR(50),
    Customer_Type VARCHAR(50),
    Gender VARCHAR(10),
    Product_Line VARCHAR(100),
    Unit_Price NUMERIC,
    Quantity INT,
    Tax NUMERIC,
    Total NUMERIC,
    Date DATE,
    Time TIME,
    Payment VARCHAR(50),
    COGS NUMERIC,
    Gross_Income NUMERIC,
    Rating NUMERIC
);

------------------- importing the data from the pc to the database---------------

COPY sales FROM '"C:\Users\User\Documents\SuperMarket Analysis.csv"'
DELIMITER ',' 
CSV HEADER;

--view dataset

select * from supermarket_sales;

-- Exploratory Data Analysis (EDA)

-- 1. Count of distinct cities
SELECT COUNT(DISTINCT "city") AS unique_cities FROM supermarket_sales;

-- 2. Branch locations
SELECT DISTINCT "branch", "city" FROM supermarket_sales;

-- 3. Count of distinct product lines
SELECT COUNT(DISTINCT "product_line") AS product_line_count FROM supermarket_sales;

-- 4. Most common payment method
SELECT "payment_method", COUNT("payment_method") AS payment_count
FROM supermarket_sales
GROUP BY "payment_method"
ORDER BY payment_count DESC
LIMIT 1;

-- 5. Most sold product line
SELECT "product_line", COUNT(*) AS total_sales
FROM supermarket_sales
GROUP BY "product_line"
ORDER BY total_sales DESC
LIMIT 1;

--6.Product line with highest revenue
SELECT "product_line", SUM("total") AS total_revenue
FROM supermarket_sales
GROUP BY "product_line"
ORDER BY total_revenue DESC
LIMIT 1;

-- 7.City with highest revenue
SELECT "city", SUM("total") AS total_revenue
FROM supermarket_sales
GROUP BY "city"
ORDER BY total_revenue DESC
LIMIT 1;

-- 8. Product line with highest VAT
SELECT "product_line", SUM("tax_5") AS highest_vat
FROM supermarket_sales
GROUP BY "product_line"
ORDER BY highest_vat DESC
LIMIT 1;

-- 9. Categorizing product lines based on average sales
SELECT "product_line", SUM("total") AS total_sales,
    CASE 
        WHEN SUM("total") > (SELECT AVG("total") FROM supermarket_sales) THEN 'Good'
        ELSE 'Bad'
    END AS product_category
FROM supermarket_sales
GROUP BY "product_line";

-- 10. Most common product line by gender
SELECT "gender", "product_line", COUNT(*) AS count
FROM supermarket_sales
GROUP BY "gender", "product_line"
ORDER BY "gender", count DESC;


-- 11. Average rating per product line
SELECT "product_line", ROUND(AVG("rating"), 2) AS avg_rating
FROM supermarket_sales
GROUP BY "product_line"
ORDER BY avg_rating DESC;


-- 12. Best average rating per branch
SELECT "branch",ROUND(AVG("rating"), 2) AS avg_rating
FROM supermarket_sales
WHERE "rating" IS NOT NULL
GROUP BY "branch"
ORDER BY "branch", avg_rating DESC;

-- 13. Gender distribution per branch
SELECT "branch", "gender", COUNT(*) AS count
FROM supermarket_sales
GROUP BY "branch", "gender"
ORDER BY "branch", count DESC;

-- 14. Most frequent gender
SELECT "gender", COUNT(*) AS count
FROM supermarket_sales
GROUP BY "gender"
ORDER BY count DESC
LIMIT 1;

-- 15. Customer type buying the most quantity
SELECT "customer_type", SUM("quantity") AS total_quantity
FROM supermarket_sales
GROUP BY "customer_type"
ORDER BY total_quantity DESC
LIMIT 1;

-- 16. Branches selling more than the average product quantity
SELECT "branch", SUM("quantity") AS total_quantity
FROM supermarket_sales
GROUP BY "branch"
HAVING SUM("quantity") > (SELECT AVG("quantity") FROM supermarket_sales);

-- 17. Customer type with highest revenue
SELECT "customer_type", SUM("total") AS total_revenue
FROM supermarket_sales
GROUP BY "customer_type"
ORDER BY total_revenue DESC
LIMIT 1;

-- 18. Customer type paying the most VAT
SELECT "customer_type", SUM("tax_5") AS total_vat
FROM supermarket_sales
GROUP BY "customer_type"
ORDER BY total_vat DESC
LIMIT 1;

-- 19. City with highest VAT
SELECT "city", SUM("tax_5") AS total_vat
FROM supermarket_sales
GROUP BY "city"
ORDER BY total_vat DESC
LIMIT 1;

-- 20. Most common customer type
SELECT "customer_type", COUNT(*) AS customer_count
FROM supermarket_sales
GROUP BY "customer_type"
ORDER BY customer_count DESC
LIMIT 1;

------------Feature Engineering------------------

---1.Revenue Calculation
ALTER TABLE supermarket_sales ADD COLUMN revenue NUMERIC;
UPDATE supermarket_sales SET revenue = "quantity" * "unit_price";

---2.Profit Calculation
ALTER TABLE supermarket_sales ADD COLUMN profit NUMERIC;
UPDATE supermarket_sales SET profit = "total" - "cogs";


--3.Premium Customer Classification
ALTER TABLE supermarket_sales ADD COLUMN premium_customer BOOLEAN;
UPDATE supermarket_sales
SET premium_customer = 
    CASE 
        WHEN "total" > (SELECT AVG("total") FROM supermarket_sales) THEN TRUE
        ELSE FALSE
    END;

--4.Time of Day Classification
ALTER TABLE supermarket_sales ADD COLUMN time_of_day VARCHAR(20);
UPDATE supermarket_sales
SET time_of_day =
    CASE 
        WHEN "time" BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
        WHEN "time" BETWEEN '12:01:00' AND '16:00:00' THEN 'Afternoon'
        ELSE 'Evening'
    END;

--5.Customer Spending Category
ALTER TABLE supermarket_sales ADD COLUMN customer_spending_category VARCHAR(20);
UPDATE supermarket_sales
SET customer_spending_category = 
    CASE 
        WHEN "total" < 100 THEN 'Low'
        WHEN "total" BETWEEN 100 AND 300 THEN 'Medium'
        ELSE 'High'
    END;
















