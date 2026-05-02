{{ config(severity = "warn") }}

select
    airport_ident,
    airport_name,
    airport_lat,
    airport_long
from
    {{ ref('silver_airports') }}
where
    (airport_lat is not null and (airport_lat < -90 or airport_lat > 90))
    or (airport_lat is not null and (airport_long < -180 or airport_long > 180))