
{{ config(
    description="Customer and region information"
) }}

with orders as (
    select * from {{ ref('stg_tpch_orders') }}
),

customers as (
    select * from {{ ref('stg_tpch_customers') }}
),

nations as (
    select * from {{ ref('stg_nation_codes') }}
)

select
    o.order_id,
    o.order_date,
    o.total_price,

    c.customer_id,
    c.customer_name,

    n.nation_name,
    n.region_name,

    -- derived fields
    extract(year from o.order_date) as order_year,
    extract(quarter from o.order_date) as order_quarter

from orders o
left join customers c
    on o.customer_id = c.customer_id
left join nations n
    on c.nation_id = n.nation_id