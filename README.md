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


## 🗄️ Database Design

A Star Schema was designed to organize the retail sales data efficiently.

### Fact Table

- fact_sales

### Dimension Tables

- dim_customer
- dim_product
- dim_date

### Star Schema

```text
                dim_customer
                     │
                     │
dim_product ─── fact_sales ─── dim_date
```

The Star Schema improves query performance, minimizes data redundancy, and simplifies reporting.

---

## 📊 SQL Business Analysis

Business insights were generated using SQL queries executed on PostgreSQL.

Some analyses include:

- Total Sales
- Total Profit
- Total Orders
- Sales by Region
- Sales by Category
- Sales by Sub-Category
- Top Performing Products
- Monthly Sales Trend
- Customer Analysis
- Profit Analysis

---

## 📈 Power BI Dashboard

An interactive Power BI dashboard was developed to visualize retail sales performance.

### Dashboard Pages

- Home Dashboard
- Executive Dashboard
- Product Dashboard
- Geographic Dashboard

### Dashboard Features

- KPI Cards
- Revenue Trend Analysis
- Profit Analysis
- Category Performance
- Regional Performance
- Product Performance
- Interactive Slicers
- Navigation Buttons
- Bookmarks
- Maps
- Treemap
- Matrix Visuals

---

## 🔮 Sales Forecasting

Future monthly sales were forecasted using Facebook Prophet.

Forecasting Steps:

- Monthly Sales Aggregation
- Prophet Model Training
- 12-Month Future Prediction
- Forecast Visualization
- Trend Analysis
- Seasonality Analysis

---

## 💡 Key Business Insights

- Technology generated the highest sales.
- Profitability varied across regions.
- Sales showed clear seasonal patterns.
- Interactive dashboards improved business reporting.
- Forecasting supports inventory and sales planning.

---

## 📁 Project Structure

```text
Retail-Sales-Analysis
│
├── data
│
├── notebooks
│
├── sql
│
├── powerbi
│
├── images
│
└── docs
```

---

## 🚀 How to Run the Project

1. Clone the repository.
2. Install Python dependencies.
3. Create the PostgreSQL database.
4. Execute SQL scripts.
5. Open the Power BI dashboard.
6. Run the forecasting notebook.

---

## 🔧 Future Improvements

- Deploy dashboard online.
- Automate ETL pipeline.
- Integrate real-time sales data.
- Build machine learning prediction models.
- Develop executive reporting portal.

---

## 👨‍💻 Author

**Gowtham S**

Aspiring Data Analyst

Skills:
- Python
- SQL
- PostgreSQL
- Power BI
- Data Visualization
- Sales Forecasting  
