with stg_orders as (
    select * from {{ ref('stg_orders') }}
),

stg_customers as (
    select * from {{ ref('stg_customers') }}
),

final as (
    select
        o.order_id,
        o.order_value,
        o.delivery_time_min,
        o.distance_km,
        o.items_count,
        o.customer_rating,
        o.discount_applied,
        o.delivery_partner_rating,
        c.age_group,
        case
            when o.order_value < 300 then 'Low'
            when o.order_value between 300 and 800 then 'Medium'
            else 'High'
        end as order_category,
        case
            when o.distance_km < 5 then 'Short'
            when o.distance_km between 5 and 10 then 'Medium'
            else 'Long'
        end as distance_category
    from stg_orders o
    left join stg_customers c on o.customer_age = c.customer_age
)

select * from final
