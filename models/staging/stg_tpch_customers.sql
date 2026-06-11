select
    C_CUSTKEY as customer_id,
    C_NAME as customer_name,   -- ✅ fix here
    C_NATIONKEY as nation_id   -- ✅ also standardize
from {{ source('TPCH', 'CUSTOMER') }}
