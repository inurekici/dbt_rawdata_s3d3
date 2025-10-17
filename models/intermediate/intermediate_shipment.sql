SELECT
orders_id,
shipping_fee,
log_cost,
CAST(ship_cost as INT64) as ship_cost
FROM {{ ref("staging_shipment")}}