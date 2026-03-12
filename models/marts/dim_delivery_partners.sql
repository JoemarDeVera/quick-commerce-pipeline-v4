with source as (
    select * from public.dim_delivery_partners
),

final as (
    select
        partner_id,
        delivery_partner_rating,
        case
            when delivery_partner_rating >= 4.5 then 'Excellent'
            when delivery_partner_rating >= 4.0 then 'Good'
            when delivery_partner_rating >= 3.5 then 'Average'
            else 'Below Average'
        end as performance_category
    from source
)

select * from final
