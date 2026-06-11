with orders as (
    select * from {{ ref('int_orders_enriched') }}
),

lineitems as (
    select * from {{ ref('stg_tpch_lineitems') }}
)

select
    o.order_id,
    o.customer_id,
    o.customer_name,
    o.nation_name,
    o.region_name,
    o.order_date,
    o.order_year,
    o.order_quarter,

    -- KPIs
    sum(l.net_price) as total_revenue,
    count(l.order_id) as number_of_items

from orders o
left join lineitems l
    on o.order_id = l.order_id

group by
    o.order_id,
    o.customer_id,
    o.customer_name,
    o.nation_name,
    o.region_name,
    o.order_date,
    o.order_year,
    o.order_quarter
