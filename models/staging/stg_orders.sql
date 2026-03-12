with source as (
    select * from public.fact_orders
),

renamed as (
    select
        order_id,
        order_value,
        delivery_time_min,
        distance_km,
        items_count,
        customer_rating,
        discount_applied,
        delivery_partner_rating,
        customer_age
    from source
)

select * from renamed
