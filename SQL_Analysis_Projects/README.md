# 🛢️ SQL Data Analytics Portfolio

Welcome to the SQL directory of my data analytics portfolio! This folder contains end-to-end relational database projects designed, queried, and optimized using **Microsoft SQL Server Management Studio (SSMS)**. 

The projects here demonstrate the full data lifecycle in SQL—ranging from raw data exploration and aggregation to complex schema cleaning, string manipulation, and deduplication.

---

## 🛠️ Key SQL Skills Demonstrated
* **Data Cleaning & Manipulation:** `CASE` statements, handling `NULL` values, string splitting (`PARSENAME`, `SUBSTRING`), and data type casting.
* **Exploratory Data Analysis (EDA):** Aggregate functions (`SUM`, `AVG`, `COUNT`), filtering (`WHERE`, `HAVING`), and categorical grouping (`GROUP BY`).
* **Advanced Querying:** Common Table Expressions (CTEs), Window Functions (`ROW_NUMBER()`, `PARTITION BY`), and Subqueries.
* **Schema Modifications:** Updating table attributes, altering columns, and removing duplicate records safely.

---

## 📂 Projects Overview

### 1. 🦠 [COVID-19 Global Data Exploration](./01-COVID-Data-Exploration/)
* **Objective:** Analyze global COVID-19 death tolls, infection rates relative to population, and vaccination progress across countries and continents.
* **Key Techniques:** Joins, CTEs, Temp Tables, Aggregate Functions, Window Functions (`SUM() OVER PARTITION`), and Data Type Conversions.
* **Key Business Insight:** Highlighted infection concentration vs. population density and mapped cumulative vaccination percentages over time.

### 2. 🏠 [Nashville Housing Data Cleaning](./02-Nashville-Housing-Data-Cleaning/)
* **Objective:** Transform raw, unstructured housing market data into a standardized, clean dataset ready for reporting and analysis.
* **Key Techniques:** Standardizing date formats, populating missing property addresses using self-joins (`ISNULL`), breaking out addresses into individual columns (`Address`, `City`, `State`), converting boolean flags (`Sold as Vacant`), and removing duplicate rows via CTEs and `ROW_NUMBER()`.
* **Key Business Insight:** Resolved structural inconsistencies across 50,000+ records and eliminated duplicate entries, ensuring data integrity.

---

## 🚀 How to Run These Queries
1. Clone or download the repository to your local machine.
2. Open **Microsoft SQL Server Management Studio (SSMS)** or your preferred SQL environment.
3. Load the corresponding raw `.csv` datasets (provided in each project directory).
4. Open the `.sql` query files and execute the scripts sequentially.
