SELECT
    orders_id,
    shipping_fee,
    logCost as log_cost,
    CAST(ship_cost as INT64) as ship_cost
FROM {{source('raw', 'shipment')}}