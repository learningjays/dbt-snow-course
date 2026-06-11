
select
    O_ORDERKEY as order_id,
    O_CUSTKEY as customer_id,
    O_ORDERDATE as order_date,
    O_TOTALPRICE as total_price
from {{ source('TPCH', 'ORDERS') }}