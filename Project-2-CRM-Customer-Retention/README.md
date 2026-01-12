# CRM Customer Retention Analysis  
**Business Analyst Case Study – Sahnawag Hussain**

---

**Business Context:**  
This project analyzes customer behavior and retention for a CRM-driven business to understand engagement patterns, churn risk, and customer lifetime value. The goal is to provide actionable insights to improve retention and increase revenue.

---

## 📊 Key Metrics / KPIs
- **Churn Rate (%)** – Customers lost over a period  
- **Retention Rate (%)** – Customers retained month-over-month  
- **Customer Lifetime Value (CLV)** – Revenue contribution per customer  
- Customer Segmentation by engagement level  

---

## BRD / FRD
- **BRD (Business Requirement Document):** Defines business objectives, stakeholders, and expected outcomes  
- **FRD (Functional Requirement Document):** Details functional requirements for dashboards, reporting, and analysis  

---

## 🛠 Analysis Overview

### SQL Queries
All queries are in the `sql/` folder. Each query answers a specific business question:  
- **Query 1:** Top customers by revenue contribution  
- **Query 2:** Customers at risk of churn  
- **Query 3:** Engagement trends across customer segments  
- **Query 4:** Retention & lifetime value analysis  

---

### Data
The `data/` folder contains all CSV files. Column definitions and relationships are documented in `data/readme.md`.  
**Key Points:**  
- Customers, Orders, and Interactions datasets linked by `customer_id`  
- Provides the foundation for retention and engagement analysis  

---

### Excel Analysis
The `excel/` folder contains pivot tables and charts for deep-dive analysis.  
**Highlights:**  
- Retention trends and churn analysis  
- Lifetime value calculations per customer segment  
- Engagement score summaries  

---

## 📈 Tableau Dashboards

### Customer Overview Dashboard
<img src="../assets/CUSTOMER OVERVIEW.png" alt="Customer Overview Dashboard" width="900"/>

---
### Customer Engagement Impact Dashboard 
<img src="../assets/Customer Engagement Impact.png" alt="Customer Engagement Impact Dashboard" width="900"/>

---
### Retention & Customer Value Dashboard
<img src="../assets/Retention & Customer Value.png" alt="Retention and Customer Value Dashboard" width="900"/>

---

## 💡 Key Insights

- A small percentage of customers contributed a large portion of total revenue  
- Premium and Enterprise customers had higher order values  
- Repeat customers generated significantly more revenue than one-time buyers  
- Customers with resolved interactions showed better retention  
- Certain regions demonstrated stronger customer loyalty  

---

## 📌 Business Recommendations

- Focus retention efforts on high-value customer segments  
- Introduce loyalty programs for repeat customers  
- Improve customer support resolution rates  
- Run targeted campaigns for low-engagement customers  
- Personalize communication based on customer behavior  

---
