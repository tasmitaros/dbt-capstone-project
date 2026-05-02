
select *
from {{ ref('scd_silver_snapshots') }}
where airport_ident = '01CN'