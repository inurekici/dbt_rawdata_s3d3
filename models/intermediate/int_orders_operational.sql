-- Operasyonel_marj = marj + nakliye ücreti - log_maliyeti - nakliye_maliyeti
SELECT 
    sm.date_date,
    sm.orders_id,
    sm.margin,
    sm.revenue,
    sm.quantity,
    sm.purchase_cost,
    s.shipping_fee,
    s.ship_cost,
    s.log_cost,
    ROUND(sm.margin + s.shipping_fee - s.log_cost - s.ship_cost) as operational_margin
FROM {{ ref('int_sales_margin')}} as sm
JOIN {{ ref("staging_shipment")}} as s
    ON s.orders_id = sm.orders_id