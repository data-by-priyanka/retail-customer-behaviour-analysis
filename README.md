# Retail Customer Behaviour Analysis

## Revenue Optimization & Customer Segmentation
**Tools:** Python | MySQL | Power BI | Excel  
**Dataset:** 3,900 transactions | **Revenue:** $233,081

---

## Business Problem
A retail e-commerce business had no visibility into whether their discount 
campaigns and subscription program were working. This project analyzes 
3,900 customer transactions to answer 6 business questions and provide 
actionable recommendations.

---

## Dataset
| Attribute | Details |
|-----------|---------|
| Rows | 3,900 customers |
| Columns | 18 features |
| Revenue | $233,081 |
| Categories | Clothing, Accessories, Footwear, Outerwear |
| Age Range | 18 to 70 years |

---

## 6 Business Questions
| # | Question |
|---|----------|
| BQ1 | What % of customers are Loyal vs Returning vs New? |
| BQ2 | Do discounts actually increase average order value? |
| BQ3 | Which product category drives the highest revenue? |
| BQ4 | Do subscribers spend more than non-subscribers? |
| BQ5 | Which age group contributes most to total revenue? |
| BQ6 | Is there a difference between Promo Code and Discount impact? |

---

## Key Findings
- **Clothing = 44.7% of revenue** — concentration risk identified
- **Discounts REDUCE AOV by $0.85** — $1,425 margin lost on 1,677 orders
- **51+ age group = 38% of revenue** — most underserved demographic
- **Only 83 new customers (2.1%)** — critical acquisition gap
- **2,583 loyal customers not subscribed** — biggest missed opportunity

---

## Tools & Workflow
| Phase | Tool | Deliverable |
|-------|------|-------------|
| 1 | Python + pandas | EDA — 7 charts |
| 2 | MySQL | 12 business queries |
| 3 | Power BI | 2-page interactive dashboard |
| 4 | Excel | Executive summary report |

---

## Project Structure





---

## How to Run
1. Clone this repository
2. Install Python libraries: `pip install pandas numpy matplotlib seaborn`
3. Open `notebooks/01_EDA_analysis.ipynb` in Jupyter
4. Import `data/cleaned_shopping_data.csv` into MySQL
5. Run queries from `sql/analysis_queries.sql`
6. Open `dashboard/retail_customer_behaviour_analysis.pbix` in Power BI

---

## Recommendations Summary
1. Fix subscription messaging → target 2,583 loyal non-subscribers
2. Launch referral program → use 3,563 loyal customers
3. Cross-sell Accessories to Clothing buyers
4. Stop blanket discounts → switch to free shipping threshold
5. Create 51+ premium loyalty program