# Quick Commerce dbt Pipeline — v4

## Overview
Data transformation layer built with **dbt (data build tool)** that transforms quick commerce orders in PostgreSQL into clean, tested, business-ready models using a staging and marts architecture.

---

## About the Dataset
This dataset is a **synthetic yet realistic simulation** of Quick Commerce (Q-Commerce) business data with nearly **1 Million Records**, inspired by popular platforms such as:

**Blinkit, Zepto, Swiggy Instamart, Dunzo, JioMart, BigBasket, Amazon Now, and Flipkart Minutes**

It is designed for learners, analysts, and data science enthusiasts who want to practice real-world data analytics workflows using Python, Pandas, and data visualization tools.

**Source:** [Kaggle — Quick Commerce Dataset by Rohit Grewal](https://www.kaggle.com/datasets/rohitgrewal/quick-commerce-dataset)

---

## Tech Stack
- **Transformation:** dbt 1.11.7
- **Database:** PostgreSQL 18
- **Language:** SQL
- **Environment:** WSL Ubuntu on Windows

---

## Project Structure
```
models/
├── staging/        ← clean raw data from PostgreSQL
│   ├── stg_orders.sql
│   └── stg_customers.sql
└── marts/          ← business-ready transformed tables
    ├── dim_customers.sql
    ├── dim_delivery_partners.sql
    ├── dim_promotions.sql
    └── fact_orders.sql
```

---

## What is Staging vs Marts?

**Staging** — cleans and renames raw data. One table, cleaned up.
- `stg_orders` — selects and cleans columns from `fact_orders`
- `stg_customers` — adds `age_group` column (Gen Z, Millennial, Gen X, Boomer)

**Marts** — business-ready tables built for analysts and visualization tools like Power BI.
- `dim_customers` — customer dimension with age groups
- `dim_delivery_partners` — partner dimension with performance categories (Excellent, Good, Average, Below Average)
- `dim_promotions` — promotions dimension with promo types (Discounted, No Discount)
- `fact_orders` — enriched orders with `order_category`, `distance_category`, `discount_status`, and `age_group`

---

## dbt Models

| Model | Schema | Type | Rows |
|-------|--------|------|------|
| stg_orders | public_staging | table | 947,752 |
| stg_customers | public_staging | table | 947,752 |
| dim_customers | public_marts | table | 947,752 |
| dim_delivery_partners | public_marts | table | 4 |
| dim_promotions | public_marts | table | 2 |
| fact_orders | public_marts | table | 947,752 |

---

## Tests
7 data quality tests passing:
- `unique` — order_id and customer_id are unique
- `not_null` — order_id, order_value, delivery_time_min have no nulls
- `accepted_values` — age_group only contains Gen Z, Millennial, Gen X, Boomer

---

## How to Run
1. Install dbt: `pip install dbt-postgres`
2. Configure `~/.dbt/profiles.yml` with your PostgreSQL credentials
3. Run models: `dbt run`
4. Run tests: `dbt test`

---

## Related Projects
- [v1 - SQLite Pipeline](https://github.com/JoemarDeVera/quick-commerce-pipeline)
- [v2 - PostgreSQL + Validation](https://github.com/JoemarDeVera/quick-commerce-pipeline-v2)
- [v3 - Apache Airflow](https://github.com/JoemarDeVera/quick-commerce-pipeline-v3)
- [v5 - Power BI Dashboard](https://github.com/JoemarDeVera/quick-commerce-pipeline-v5)