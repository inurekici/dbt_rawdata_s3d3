SELECT
    date_date,
    SUM(margin) as margin,
    COUNT(orders_id) as number_of_transactions,
    SUM(revenue) as revenue,
    ROUND(AVG(revenue), 2) as avg_revenue,
    SUM(operational_margin) as operational_margin,
    SUM(purchase_cost) purchase_cost,
    SUM(shipping_fee) as shipping_fee,
    SUM(log_cost) as log_cost,
    SUM(ship_cost) as ship_cost,
    SUM(quantity) as quantity
FROM {{ ref("int_orders_operational")}}
GROUP BY date_date
ORDER BY date_date DESC