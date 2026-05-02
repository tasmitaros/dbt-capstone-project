{{
    config(
        materialized = 'incremental',
        on_schema_change = 'fail'
    )
}}

with src_airport_comments as (

    select *
    from {{ ref('src_airport_comments') }}

)

select
    comment_id,
    airport_ident,
    comment_timestamp,
    coalesce(member_nickname, '__UNKNOWN__') as member_nickname,
    comment_subject,
    comment_body,
    current_timestamp() as loaded_at
from
    src_airport_comments
where
    nullif(comment_body, '') is not null

{% if is_incremental() %}
    and comment_id > (select max(t.comment_id) from {{ this }} as t)
{% endif %}