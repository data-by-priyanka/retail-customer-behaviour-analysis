<div align="center">

#   Retail Customer Behaviour Analysis
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

retail-customer-behaviour-analysis/
│
├── README.md
│
├── data/
│   ├── shopping_behavior_updated.csv    # Original raw data
│   └── cleaned_shopping_data.csv        # Cleaned for MySQL import
│
├── notebooks/
│   └── 01_EDA_analysis.ipynb           # Full Python analysis
│
├── sql/
│   └── analysis_queries.sql            # All 12 MySQL queries
│
├── dashboard/
│   └── retail_customer_behaviour_analysis.pbix  # Power BI file
│
├── excel/
│   └── Customer_Behaviour_Analysis.xlsx  # Excel executive report
│
└── outputs/
└── insights_and_recommendations.md  # Business insights

---

## Data Cleaning & Preparation

### Data Quality Audit:
| Check | Result | Action |
|---|---|---|
| Missing values | 0 across all 18 columns | None needed |
| Duplicate Customer IDs | 0 | None needed |
| Negative purchase amounts | 0 | None needed |
| Invalid age values | 0 | None needed |

### Cleaning Steps:
1. Loaded raw CSV with pandas — confirmed 3,900 rows × 18 columns
2. Standardized column names — lowercase with underscores for MySQL compatibility
3. Renamed `purchase_amount_(usd)` → `purchase_amount`
4. Engineered `age_group` column using pd.cut() with 4 bins
5. Engineered `customer_segment` — New / Returning / Loyal based on previous purchases
6. Exported clean dataset with **3,900 valid rows** for MySQL import

---

## Exploratory Data Analysis

### Customer Segmentation:

Loyal          3,563 customers  →  91.4% of total
Returning      254 customers  →   6.5% of total
New            83 customers  →   2.1% of total

### Revenue by Category:

Clothing        $104,264  →  44.7% of revenue
Accessories      $74,200  →  31.8% of revenue
Footwear         $36,093  →  15.5% of revenue
Outerwear        $18,524  →   7.9% of revenue

### Discount Impact:

No Discount   →  AOV $60.13
With Discount →  AOV $59.28  ⚠️ DISCOUNTS REDUCE SPENDING

### Age Group Revenue:

51+      $88,480  →  38.0% of revenue  ← HIGHEST
36-50    $65,629  →  28.2% of revenue
26-35    $44,342  →  19.0% of revenue
18-25    $34,630  →  14.8% of revenue

---

## Key Findings

### Finding 1 — Clothing Dominates But Creates Risk
| Category | Revenue | % Share |
|---|---|---|
| Clothing | $104,264 | 44.7% |
| Accessories | $74,200 | 31.8% |
| Footwear | $36,093 | 15.5% |
| Outerwear | $18,524 | 7.9% |

> 💡 **Clothing + Accessories = 76.5% of all revenue — concentration risk**

---

### Finding 2 — Discounts Reduce AOV, Not Increase It
| Discount Status | Avg Order Value | Total Orders |
|---|---|---|
| No Discount | $60.13 | 2,223 |
| With Discount | $59.28 | 1,677 |

> 💡 **$0.85 reduction × 1,677 orders = $1,425 margin lost on discounts**

---

### Finding 3 — 51+ Is Highest Value, Most Ignored Demographic
| Age Group | Revenue | % Share |
|---|---|---|
| 51+ | $88,480 | 38.0% |
| 36-50 | $65,629 | 28.2% |
| 26-35 | $44,342 | 19.0% |
| 18-25 | $34,630 | 14.8% |

> 💡 **51+ generates 38% of revenue — most retail brands ignore this group**

---

### Finding 4 — Zero Customer Acquisition Pipeline
| Segment | Count | % of Total |
|---|---|---|
| Loyal | 3,563 | 91.4% |
| Returning | 254 | 6.5% |
| New | 83 | 2.1% |

> 💡 **Only 83 new customers — business has no growth engine**

---

### Finding 5 — 2,583 Loyal Customers Not Subscribed
| Subscription | Loyal Customers | % of Loyal |
|---|---|---|
| Not Subscribed | 2,583 | 72.5% |
| Subscribed | 980 | 27.5% |

> 💡 **Subscribers spend LESS ($59.49 vs $59.87) — subscription messaging is broken**

---

### Summary Table:
| Metric | Value | Insight |
|---|---|---|
| Total Revenue | $233,081 | Baseline |
| Avg Order Value | $59.76 | Flat across all segments |
| Top Category | Clothing 44.7% | Concentration risk |
| Discount ROI | -$0.85 per order | Negative |
| Top Age Group | 51+ ($88,480) | Underserved |
| New Customers | 83 (2.1%) | Critical gap |
| Loyal Not Subscribed | 2,583 | Biggest opportunity |

---

## Dashboard

### Python EDA Charts (7 charts):
- Revenue by Product Category
- Revenue by Age Group
- Discount Impact on AOV
- Subscriber vs Non-Subscriber Spend
- Customer Segmentation
- Revenue by Gender
- Promo Code vs Discount 4-Group Analysis

### Power BI Dashboard — Page 1: Revenue & Demographics
> Shows: Total Revenue KPI, AOV KPI, Revenue by Category, 
> Revenue by Age Group, Revenue by Season, Revenue by Gender
> Interactive slicers: Category | Season | Gender

### Power BI Dashboard — Page 2: Segmentation & Promotions
> Shows: Loyal Customers KPI, New Customers KPI, 
> Loyal Not Subscribed KPI, Discount Margin Lost KPI,
> Customer Segmentation, Discount Impact, Promo Analysis
>   File: `dashboard/retail_customer_behaviour_analysis.pbix`

---

## Top 5 Recommendations

###   Recommendation 1 — Fix Subscription Messaging
**Insight:** 2,583 loyal customers are not subscribed. 
Subscribers actually spend LESS — meaning the value proposition is wrong.

**Action:**
- Stop selling subscription as a "savings" tool
- Reframe as **convenience and priority access**
- Target 2,583 loyal non-subscribers with corrected messaging

**Estimated Impact:** 312 new subscribers × $59.49 = **+$18,561 recurring revenue**

---

###   Recommendation 2 — Launch Customer Referral Program
**Insight:** Only 83 new customers (2.1%) — zero acquisition pipeline.

**Action:**
- Use 3,563 loyal customers as brand ambassadors
- Offer referral rewards for bringing new customers
- Message: *"Share with a friend — you both get rewarded"*

**Estimated Impact:** 50 new customers × $59.76 × 5 orders = **+$14,940 LTV**

---

###   Recommendation 3 — Cross-Sell Accessories to Clothing Buyers
**Insight:** Clothing = 44.7% of revenue but creates concentration risk.

**Action:**
- Bundle Accessories with Clothing purchases
- Email campaigns targeting 1,737 Clothing-only buyers
- Show complementary Accessories at checkout

**Estimated Impact:** 1,737 × 20% × $59.76 = **+$10,380 incremental revenue**

---

###    Recommendation 4 — Stop Blanket Discounts
**Insight:** Discounts reduce AOV by $0.85 — negative ROI proven.

**Action:**
- Immediately pause all blanket discount campaigns
- A/B test free shipping threshold ($75+) instead
- Reserve discounts only for cart abandonment recovery

**Estimated Impact:** **+$1,425 margin recovered** immediately

---

###   Recommendation 5 — Create 51+ Premium Loyalty Program
**Insight:** 51+ = 38% of revenue but receives zero targeted marketing.

**Action:**
- Launch a dedicated 51+ loyalty tier
- Offer priority customer service + early access to new products
- Targeted email campaigns with relevant product selection

**Estimated Impact:** 10% retention boost = **+$8,848 protected annually**

---


## Author & Contact

**Priyanka Mishra**  
Data Analyst | Google Certified | BFSI Domain Expert

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Connect-blue?logo=linkedin)](https://www.linkedin.com/in/priyanka-mishra-data-analyst/)
[![GitHub](https://img.shields.io/badge/GitHub-Follow-black?logo=github)](https://github.com/data-by-priyanka)
[![Portfolio](https://img.shields.io/badge/Portfolio-Visit-orange?logo=github)](datascienceportfol.io/priyankaofficial)

---

<div align="center">

⭐ **If you found this project helpful, please give it a star!** ⭐

*Built as part of a Data Analytics Portfolio — Python | MySQL | Power BI | Excel*

</div>
