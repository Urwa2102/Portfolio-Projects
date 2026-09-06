# 🦠 COVID-19 Global Data Exploration

## 📌 Project Overview
This project performs an in-depth exploratory data analysis (EDA) on global COVID-19 death rates, infection counts, and vaccination progress. Using **Microsoft SQL Server Management Studio (SSMS)**, raw tracking data was queried to extract actionable public health insights, compare country-level impacts, and prepare aggregated tables for downstream data visualization.

---

## 🛠️ SQL Concepts & Functions Applied
* **Complex Joins:** Joined `CovidDeaths` and `CovidVaccinations` tables on `Location` and `Date`.
* **Window Functions:** Utilized `SUM() OVER (PARTITION BY ... ORDER BY ...)` to calculate running totals of vaccinations.
* **CTEs & Temp Tables:** Constructed Common Table Expressions and Temporary Tables to compute derived metrics (e.g., vaccination percentages over time) within single query executions.
* **Aggregations & Grouping:** Used `SUM`, `AVG`, `MAX`, `GROUP BY`, and `HAVING` to summarize metrics across continents and nations.
* **Data Type Conversions:** Handled type conversions using `CAST()` and `CONVERT()` to resolve string-to-numeric format mismatches.

---

## 🔍 Key Data Insights & Analysis

1. **Infection vs. Death Rate:** Evaluated the likelihood of dying if infected with COVID-19 in specific countries, tracking mortality percentage changes over the duration of the pandemic.
2. **Total Cases vs. Population:** Measured the percentage of population infected to highlight countries with the highest infection density.
3. **Highest Death Counts by Continent:** Grouped metrics to compare total mortality across continents (North America, South America, Europe, Asia, Africa, Oceania).
4. **Global Progress on Vaccinations:** Modeled cumulative vaccination rollouts relative to total population size, revealing disparities in vaccination rates across developing vs. developed regions.

---

## 📁 Files in This Directory
* `Data_Exploration.sql` — Main SQL script containing all exploratory queries, CTEs, and view definitions.
* `CovidDeaths(csv).csv` — Primary dataset tracking case counts, deaths, and population figures.
* `CovidVaccinations(csv).csv` — Secondary dataset tracking testing volumes and vaccination rollouts.
* `README.md` — Project documentation.

---

## 🚀 How to Execute the Analysis
1. Open **SSMS** and connect to your local database instance.
2. Import `CovidDeaths(csv).csv` and `CovidVaccinations(csv).csv` as database tables.
3. Open `Data_Exploration.sql` and run the queries sequentially to view results and create analytical views.
