select
    L_ORDERKEY as order_id,
    L_EXTENDEDPRICE,
    L_DISCOUNT,
    L_EXTENDEDPRICE * (1 - L_DISCOUNT) as net_price
from {{ source('TPCH', 'LINEITEM') }}
