# 📊 Sales Performance Analysis — SQL Project

**Author:** Saravana Kumar
**Tools:** SQL (SQLite), Python, Excel
**Dataset:** 1,000 retail transactions | Jan 2023 – Jan 2024

---

## 📁 Project Overview

This project analyzes retail sales data using SQL to uncover key business insights around revenue, product performance, customer demographics, and purchasing trends.

---

## 📌 Key Findings

| Metric | Value |
|--------|-------|
| Total Revenue | ₹4,56,000 |
| Total Transactions | 1,000 |
| Average Order Value | ₹456 |
| Total Units Sold | 2,514 |

### 🏆 Revenue by Category
| Category | Orders | Revenue |
|----------|--------|---------|
| Electronics | 342 | ₹1,56,905 |
| Clothing | 351 | ₹1,55,580 |
| Beauty | 307 | ₹1,43,515 |

### 👥 Revenue by Gender
| Gender | Orders | Revenue | Avg Age |
|--------|--------|---------|---------|
| Female | 510 | ₹2,32,840 | 41.4 |
| Male | 490 | ₹2,23,160 | 41.4 |

### 📅 Top Age Group by Revenue
- **46–55 years** → ₹1,00,690 (highest spending segment)
- **26–35 years** → ₹98,480
- **36–45 years** → ₹91,870

---

## 🗂️ Files
- `sales_performance.csv` — Raw dataset
- `sales_analysis.sql` — 10 SQL queries with business insights

---

## 💡 SQL Concepts Used
- `GROUP BY`, `ORDER BY`, `HAVING`
- `CASE WHEN` for segmentation
- Aggregate functions: `SUM`, `COUNT`, `AVG`, `MAX`
- Subqueries for percentage calculations
- Date functions: `STRFTIME`
- `LIMIT` for top-N analysis

---

## 🔗 Related Project
- [Sales Performance Power BI Dashboard](https://github.com/saravanakumar9621-crypto/Sales-Performance)
