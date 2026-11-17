with 

source as (

    select * from {{ source('flights', 'dim_airline') }}

),

renamed as (

    select
        upper(trim(airlineid)) as airline_id
        upper(trim(airlinename)) as airline_name

    from source

)

select * from renamed
