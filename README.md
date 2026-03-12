# Quick Commerce dbt Pipeline v4

## Overview
Data transformation layer built with dbt that transforms 947,752 quick commerce orders in PostgreSQL into clean, tested, business-ready models.

## Tech Stack
- **Transformation:** dbt 1.11.7
- **Database:** PostgreSQL 18
- **Language:** SQL
- **Environment:** WSL Ubuntu on Windows

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

## Models
- **stg_orders** — cleans raw orders data
- **stg_customers** — adds age group categories (Gen Z, Millennial, Gen X, Boomer)
- **dim_customers** — customer dimension with age groups
- **dim_delivery_partners** — partner dimension with performance categories
- **dim_promotions** — promotions dimension with promo types
- **fact_orders** — enriched orders with order and distance categories

## Tests
7 data quality tests including unique, not_null, and accepted_values checks.

## How to Run
1. Install dbt: `pip install dbt-postgres`
2. Configure `~/.dbt/profiles.yml` with your PostgreSQL credentials
3. Run models: `dbt run`
4. Run tests: `dbt test`

## Related Projects
- [v1 - SQLite Pipeline](https://github.com/JoemarDeVera/quick-commerce-pipeline)
- [v2 - PostgreSQL + Validation](https://github.com/JoemarDeVera/quick-commerce-pipeline-v2)
- [v3 - Apache Airflow](https://github.com/JoemarDeVera/quick-commerce-pipeline-v3)
