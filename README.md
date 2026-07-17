# 📊 Retail Sales Analysis and Forecasting

## 📌 Project Overview

This project demonstrates an end-to-end Retail Sales Analysis and Forecasting solution using Python, PostgreSQL, SQL, Power BI, and Prophet.

The project covers the complete data analytics workflow, including data cleaning, exploratory data analysis, database design, SQL-based business analysis, interactive Power BI dashboards, and future sales forecasting.

The objective is to transform raw retail sales data into meaningful business insights that support data-driven decision-making.

---

## 🎯 Objectives

- Clean and preprocess retail sales data using Python.
- Design a Star Schema database in PostgreSQL.
- Perform business analysis using SQL.
- Build interactive dashboards in Power BI.
- Forecast future sales using Prophet.
- Generate actionable business insights.

---

## 🛠️ Tools & Technologies

| Category | Tools Used |
|----------|------------|
| Programming Language | Python |
| Data Analysis | Pandas, NumPy |
| Data Visualization | Matplotlib |
| Database | PostgreSQL |
| SQL | PostgreSQL SQL |
| Business Intelligence | Power BI |
| Forecasting | Prophet |
| Development Environment | Jupyter Notebook |
| Version Control | Git & GitHub |


## 📂 Dataset

**Dataset Name:** Sample Superstore

The Sample Superstore dataset contains transactional retail sales data. It includes information about customers, products, orders, sales, profit, shipping, and geographical regions. This dataset is widely used for learning and demonstrating data analytics, business intelligence, and forecasting techniques.

### Dataset Summary

| Attribute | Value |
|-----------|-------|
| Domain | Retail Sales |
| Total Records | 9,994 |
| Total Features | 21 |
| Data Type | Transactional Sales Data |
| Source | Sample Superstore Dataset |


## 🔄 Project Workflow

The project follows an end-to-end data analytics workflow:

1. **Data Collection**
   - Loaded the Sample Superstore dataset into Jupyter Notebook.

2. **Data Cleaning**
   - Cleaned missing values and standardized data.
   - Converted data types.
   - Created additional columns required for analysis.

3. **Database Design**
   - Designed a Star Schema consisting of:
     - Fact Table: `fact_sales`
     - Dimension Tables:
       - `dim_customer`
       - `dim_product`
       - `dim_date`

4. **PostgreSQL Integration**
   - Connected Python to PostgreSQL using SQLAlchemy.
   - Created database tables.
   - Loaded cleaned data into PostgreSQL.

5. **SQL Business Analysis**
   - Wrote SQL queries to answer business questions and generate insights.

6. **Power BI Dashboard**
   - Connected Power BI to PostgreSQL.
   - Built interactive dashboards with KPIs, charts, slicers, and maps.

7. **Sales Forecasting**
   - Used Prophet to forecast future monthly sales.
   - Visualized forecast trends and seasonality.
