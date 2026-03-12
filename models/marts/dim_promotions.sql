with source as (
    select * from public.dim_promotions
),

final as (
    select
        promo_id,
        discount_applied,
        case
            when discount_applied = 1 then 'Discounted'
            else 'Full Price'
        end as promo_type
    from source
)

select * from final
