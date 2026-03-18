# 🍕 Pizza Sales Data Analysis (SQL Project)

## 📌 Project Overview

This project analyzes a **pizza sales dataset** using SQL to extract meaningful business insights.
The goal is to simulate real-world data analysis tasks such as revenue tracking, customer behavior analysis, and product performance evaluation.

---

## 🎯 Problem Statement

A pizza restaurant wants to understand its sales performance and customer preferences.
Using transactional data, we aim to answer key business questions like:

* What is the total revenue generated?
* Which pizzas are most popular?
* What are the peak ordering hours?
* Which categories contribute the most to revenue?
* How do sales evolve over time?

---

## 🗂️ Database Schema

The database consists of 4 main tables:

* **orders** → Stores order date and time
* **order_details** → Contains items within each order
* **pizzas** → Includes pizza size and pricing
* **pizza_types** → Contains pizza names, categories, and ingredients

📄 Full schema available here: 

---

## 🔗 Table Relationships

```
orders → order_details → pizzas → pizza_types
```

* Each order can have multiple items
* Each pizza belongs to a pizza type
* Each pizza type belongs to a category

---

## 📊 Key SQL Analyses Performed

### 🟢 Basic Analysis

* Total number of orders
* Total revenue generated
* Highest-priced pizza
* Most common pizza size
* Top 5 most ordered pizzas

### 🟡 Intermediate Analysis

* Quantity of pizzas sold by category
* Order distribution by hour
* Average pizzas ordered per day
* Top pizzas by revenue

### 🔴 Advanced Analysis

* Percentage revenue contribution by pizza
* Cumulative revenue over time (window functions)
* Top 3 pizzas per category (ranking using `RANK()`)

---

## 🧠 Key Concepts Used

* **JOINs** (INNER JOIN across multiple tables)
* **Aggregation** (`SUM`, `COUNT`, `AVG`)
* **Grouping** (`GROUP BY`)
* **Window Functions** (`OVER`, `PARTITION BY`)
* **Ranking Functions** (`RANK`)
* **Subqueries & CTEs**

---

## 📸 Screenshots

Visual outputs of queries are available in the `screenshots/` folder.

---

## 🛠️ Tools Used

* PostgreSQL (pgAdmin 4)
* SQL
* Jupyter Notebook (for data loading)

---

## 🚀 How to Run This Project

1. Create a PostgreSQL database
2. Run `schema.sql` to create tables
3. Import dataset into tables
4. Execute queries from `queries.sql`

---

## 📈 Insights (Example)

* Certain pizza categories dominate revenue
* Peak ordering occurs during specific hours
* A small number of pizzas contribute a large portion of revenue

---

## 💡 Future Improvements

* Add dashboards (Power BI / Tableau)
* Perform time-series forecasting
* Build a recommendation system

---

## 🙌 Author

**Your Name**

Bishal Maity 
---

⭐ If you found this project useful, feel free to star the repo!
