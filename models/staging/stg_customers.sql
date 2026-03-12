with source as (
    select * from public.dim_customers
),

renamed as (
    select
        customer_id,
        customer_age,
        case
            when customer_age < 25 then 'Gen Z'
            when customer_age between 25 and 40 then 'Millennial'
            when customer_age between 41 and 55 then 'Gen X'
            else 'Boomer'
        end as age_group
    from source
)

select * from renamed
