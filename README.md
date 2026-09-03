# 📊 Data Analytics SQL Portfolio

Welcome to my Data Analytics SQL Portfolio! This repository showcases end-to-end relational database projects developed using **Microsoft SQL Server Management Studio (SSMS)**. 

The projects in this repository cover the complete data analytics lifecycle in SQL—from **raw data exploration and metrics aggregation** to **advanced schema modification, string parsing, and deduplication**.

---

## 🛠️ Tools & Technologies Used
* **Database Management System:** Microsoft SQL Server (SSMS)
* **SQL Techniques & Operations:**
  * **Data Manipulation (DML):** `SELECT`, `WHERE`, `GROUP BY`, `ORDER BY`, Aggregate Functions (`SUM`, `MAX`, `AVG`), `JOIN` (Self-Join, Inner, Outer), Subqueries, Common Table Expressions (CTEs), Temporary Tables (`#TempTables`).
  * **Window Functions:** `ROW_NUMBER() OVER (PARTITION BY ... ORDER BY ...)`.
  * **Data Definition & Modification (DDL/DML):** `ALTER TABLE`, `ADD`, `UPDATE`, `DELETE`, `DROP COLUMN`.
  * **String & Data Functions:** `SUBSTRING`, `CHARINDEX`, `PARSENAME`, `REPLACE`, `LEN`, `CONVERT`, `ISNULL`, `CASE` statements.
* **Database Objects:** Database Views (`CREATE VIEW`).

---

## 📂 Repository Structure

```text
Portfolio-Projects/
├── 01-COVID-Data-Exploration/
│   ├── CovidDeaths(csv).csv              # Global COVID-19 death records dataset
│   ├── CovidVaccinations(csv).csv        # Global vaccination tracking dataset
│   └── portfolioProject.sql              # Exploratory SQL analysis queries
│
├── 02-Nashville-Housing-Data-Cleaning/
│   ├── Nashville Housing Data for Data Cleaning .csv # Raw housing market dataset
│   └── Data Cleaning after Exploration.sql           # Data transformation & cleaning SQL script
│
└── README.md                             # Portfolio documentation
