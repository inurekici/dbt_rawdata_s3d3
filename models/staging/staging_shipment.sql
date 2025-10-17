SELECT
    orders_id,
    shipping_fee,
    logCost as log_cost,
    ship_cost
FROM {{source('raw', 'shipment')}}