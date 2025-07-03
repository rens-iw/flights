with
fact_flights as (
    select * from {{ ref('clean_fact_flights') }}
),
airline as (
    select * from {{ ref('clean_dim_airline') }}
),
origin_airport as (
    select * from {{ ref('clean_dim_airport') }}
),
dest_airport as (
    select * from {{ ref('clean_dim_airport') }}
)

select
    f.*,
    a.airline_name,
    o.airport_name as origin_airport_name,
    d.airport_name as dest_airport_name

from fact_flights f
left join airline a
    on f.airline_id = a.airline_id
left join origin_airport o
    on f.origin_airport_code = o.airport_code
left join dest_airport d
    on f.dest_airport_code = d.airport_code