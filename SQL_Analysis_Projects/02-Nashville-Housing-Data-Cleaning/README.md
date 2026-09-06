# 🏠 Nashville Housing Data Cleaning in SQL

## 📌 Project Overview
Raw real estate datasets often contain inconsistent formatting, missing values, duplicate entries, and unparsed fields. This project focuses on taking a raw, uncleaned dataset of over 50,000 Nashville housing records and transforming it into a clean, standardized, and structured database using **Microsoft SQL Server Management Studio (SSMS)**. 

The primary focus is strictly on **Data Cleaning and Transformation** to prepare the data for downstream business analytics and reporting.

---

## 🛠️ SQL Cleaning Techniques & Functions Applied

* **Date Standardization:** Converted non-standard datetime fields into clean, uniform `Date` formats using `CONVERT()`.
* **Populating Missing Data:** Handled null `PropertyAddress` values by performing self-joins (`JOIN` on `ParcelID`) and using `ISNULL()` to fill in missing locations based on matching parcel references.
* **String Parsing & Feature Engineering:**
  * Used `SUBSTRING()` and `CHARINDEX()` to split combined property addresses into separate `Address` and `City` columns.
  * Applied `PARSENAME()` with `REPLACE()` to cleanly parse owner addresses into three distinct columns (`Address`, `City`, `State`).
* **Categorical Normalization:** Used `CASE` statements to update and standardize inconsistent boolean flags (e.g., converting mixed 'Y', 'N', 'Yes', and 'No' values to uniform 'Yes' and 'No' entries in the `SoldAsVacant` column).
* **Deduplication:** Employed Common Table Expressions (CTEs) combined with `ROW_NUMBER()` partitioned across core identifiers (`ParcelID`, `PropertyAddress`, `SalePrice`, `SaleDate`, `LegalReference`) to isolate and remove duplicate rows.
* **Schema Optimization:** Dropped unused and redundant columns (`ALTER TABLE ... DROP COLUMN`) to optimize storage efficiency and query readability.

---

## 🔍 Key Transformation Outcomes

1. **Address Disaggregation:** Separated monolithic address strings into independent structural components, allowing multi-level spatial analysis by city and state.
2. **Elimination of Nulls in Core Fields:** Recovered missing property addresses using historical parcel records, reducing missing address entries to zero.
3. **Data Integrity & Quality Assurance:** Removed exact duplicate property sales entries, ensuring aggregate calculations (e.g., average sale prices) remain unbiased.

---

## 📁 Files in This Directory
* `Data_Cleaning.sql` — Complete SQL script containing all data cleaning transformations, updates, and schema modifications.
* `NashvilleHousing.csv` — Raw housing market dataset prior to cleaning.
* `README.md` — Project documentation.

---

## 🚀 How to Run the Cleaning Script
1. Open **SSMS** and create a new database (e.g., `PortfolioProject`).
2. Import `NashvilleHousing.csv` into your database.
3. Open `Data_Cleaning.sql` and run the queries sequentially to view the step-by-step transformations and apply the updates to your table.
