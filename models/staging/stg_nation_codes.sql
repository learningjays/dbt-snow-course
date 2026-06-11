
select
    nation_id,
    nation_name,
    region_key,
    region_name
from {{ ref('nation_codes') }}