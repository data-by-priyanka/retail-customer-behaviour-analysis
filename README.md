<div align="center">

# 🛍️ Retail Customer Behaviour Analysis
### Revenue Optimization & Customer Segmentation — End-to-End Data Analytics Project

[![Python](https://img.shields.io/badge/Python-3.x-blue?logo=python)](https://python.org)
[![MySQL](https://img.shields.io/badge/MySQL-8.0-orange?logo=mysql)](https://mysql.com)
[![PowerBI](https://img.shields.io/badge/PowerBI-Desktop-yellow?logo=powerbi)](https://powerbi.microsoft.com)
[![Excel](https://img.shields.io/badge/Microsoft-Excel-green?logo=microsoftexcel)](https://microsoft.com/excel)
[![Google Certificate](https://img.shields.io/badge/Google-Advanced%20Data%20Analytics-green?logo=google)](https://coursera.org)

</div>

---

## Table of Contents
- [Overview](#overview)
- [Business Problem](#business-problem)
- [Dataset](#dataset)
- [Tools & Technologies](#tools--technologies)
- [Project Structure](#project-structure)
- [Data Cleaning & Preparation](#data-cleaning--preparation)
- [Exploratory Data Analysis](#exploratory-data-analysis)
- [Key Findings](#key-findings)
- [Dashboard](#dashboard)
- [Top 5 Recommendations](#top-5-recommendations)
- [How to Run This Project](#how-to-run-this-project)
- [Author & Contact](#author--contact)

---

## Overview

This project analyzes **3,900 retail customer transactions** worth **$233,081** to uncover 
behavioral patterns around discounts, subscriptions, age demographics, and product categories.

A complete end-to-end data analysis pipeline was built using:
- **Python** for data cleaning and exploratory analysis (7 charts)
- **MySQL** for SQL-based querying including window functions (12 queries)
- **Power BI** for a 2-page interactive dashboard
- **Excel** for an executive summary report with pivot tables

The goal is to provide data-driven recommendations that optimize revenue, 
fix discount strategy, and convert loyal customers into subscribers.

---

## Business Problem

A retail e-commerce business had no visibility into whether their discount 
campaigns and subscription program were generating value. The marketing 
team was running blanket discounts without knowing if they increased spending.

This project answers 6 business questions:

> *"What is driving revenue — and what is silently hurting it?"*

Specifically:
- What % of customers are Loyal vs Returning vs New?
- Do discounts actually increase average order value?
- Which product category drives the highest revenue?
- Do subscribers spend more than non-subscribers?
- Which age group contributes most to total revenue?
- Is there a difference between Promo Code and Discount impact?

---

## Dataset

| Property | Details |
|---|---|
| Source | Kaggle — Shopping Behavior Dataset |
| File | `shopping_behavior_updated.csv` |
| Total Records | 3,900 rows |
| Columns | 18 original + 2 engineered |
| Revenue | $233,081 |

### Original Columns:
| Column | Description |
|---|---|
| `customer_id` | Unique identifier per customer |
| `age` | Customer age |
| `gender` | Male / Female |
| `item_purchased` | Product name |
| `category` | Clothing / Accessories / Footwear / Outerwear |
| `purchase_amount` | Transaction value in USD |
| `location` | US state |
| `season` | Fall / Spring / Summer / Winter |
| `review_rating` | Customer rating (1–5) |
| `subscription_status` | Yes / No |
| `discount_applied` | Yes / No |
| `promo_code_used` | Yes / No |
| `previous_purchases` | Number of past purchases |
| `payment_method` | Payment type used |
| `frequency_of_purchases` | How often they shop |

### Engineered Columns:
| Column | Description |
|---|---|
| `age_group` | 18-25 / 26-35 / 36-50 / 51+ |
| `customer_segment` | New / Returning / Loyal |

---

## Tools & Technologies

| Tool | Purpose |
|---|---|
| Python (Pandas) | Data cleaning, feature engineering, EDA |
| Matplotlib & Seaborn | Static data visualizations (7 charts) |
| MySQL 8.0 | SQL queries including window functions (12 queries) |
| Microsoft Power BI | 2-page interactive dashboard |
| Microsoft Excel | Pivot tables + executive summary report |
| Jupyter Notebook | Development environment |
| VS Code | Code editor |
| GitHub | Version control and portfolio |

---

## Project Structure
