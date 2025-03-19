# 🛒 Supermarket Sales Analysis Exploratory Data Analysis Using SQL

## 📌 Overview
This project analyzes supermarket sales data using SQL. The analysis includes exploratory data analysis (EDA) and feature engineering to gain insights into sales trends, customer behavior, and revenue generation.

## 📊 Dataset
The dataset contains transaction details from a supermarket, including:
- Invoice ID
- Branch & City
- Customer Type & Gender
- Product Line & Quantity
- Pricing, Tax, and Total Amount
- Date & 🕒 Time of Purchase
- Payment Method
- Cost of Goods Sold (COGS)
- Gross Income & Rating

## 🛠 SQL Operations
### 1. **📋 Table Creation**
A table `supermarket_sales` is created to store the data.

### 2. **📥 Data Import**
The dataset is imported into the database using the `COPY` command.

### 3. **📊 Exploratory Data Analysis (EDA)**
Key insights extracted from the data:
-  Count of distinct cities and branch locations
-  Most common payment method and product lines
-  Revenue and sales distribution across cities and branches
-  Customer segmentation based on purchase behavior

### 4. **⚙️ Feature Engineering**
New columns added to enhance analysis:
- ** Revenue Calculation**: `quantity * unit_price`
- ** Profit Calculation**: `total - cogs`
- ** Premium Customer Classification**: Identifies customers with above-average spending
- ** Time of Day Classification**: Categorizes purchases as Morning, Afternoon, or Evening
- ** Customer Spending Category**: Classifies spending into Low, Medium, and High

## 🔎 Insights & Findings
- 🏬 **Branch B generates the highest revenue**, indicating strong customer demand in that location.
- 💳 **E-wallet is the most preferred payment method**, showing a shift toward digital transactions.
- 📈 **Health and Beauty is the best-performing product line** in terms of revenue and sales volume.
- 🕒 **Most sales occur in the evening**, suggesting peak shopping hours.
- 👥 **Female customers make more purchases than male customers**, indicating potential for targeted marketing strategies.
- 💰 **Member customers contribute the highest revenue**, proving the importance of loyalty programs.
- 📍 **The city with the highest VAT collection aligns with the highest revenue**, highlighting its economic impact.

## 🚀 How to Use
1. Run the `CREATE TABLE` statement to set up the database.
2. Import the dataset using the `COPY` command.
3. Execute EDA queries to extract insights.
4. Apply feature engineering for deeper analysis.

## 🛠 Tools Used
- **🐘 PostgreSQL** (Relational Database Management System)
- **📝 SQL Queries** for data analysis and transformation

## 🔮 Future Scope
- 📊 Creating interactive dashboards using **Power BI** or **Tableau**
- 📉 Implementing machine learning models for sales forecasting
- 📦 Advanced customer segmentation using clustering techniques
- 📜 Automating SQL queries for real-time data insights

## 🏁 Conclusion
This project provides valuable insights into supermarket sales, customer behavior, and revenue trends using SQL. By leveraging exploratory data analysis and feature engineering, we can better understand sales patterns and improve decision-making. Future enhancements, such as machine learning and visualization tools, can further optimize business strategies and customer engagement.

