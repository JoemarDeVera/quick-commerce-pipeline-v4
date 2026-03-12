with stg_customers as (
    select * from {{ ref('stg_customers') }}
)

select
    customer_id,
    customer_age,
    age_group
from stg_customers
