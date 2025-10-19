SELECT
    date_date,
    COUNT(orders_id) as total_number_of_transactions,
    SUM(revenue) as total_revenue,
    ROUND(AVG(revenue), 2) as avg_revenue,
    SUM(operational_margin) as total_operational_margin,
    SUM(purchase_cost) total_purchase_cost,
    SUM(shipping_fee) as total_shipping_fee,
    SUM(log_cost) as total_log_cost,
    SUM(quantity) as total_quantity
FROM {{ ref("int_orders_operational")}}
GROUP BY date_date
ORDER BY date_date DESC