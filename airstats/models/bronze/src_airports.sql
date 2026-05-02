{{ config(materialized='ephemeral') }}
with airports as (

    select *
    from {{ source('airstats', 'airports') }}

)

select
    ident as airport_ident,
    type as airport_type,
    name as airport_name,
    latitude_deg as airport_latitude_deg,
    longitude_deg as airport_longitude_deg,
    continent,
    iso_country,
    iso_Region
from
    airports