WITH nb_products_query AS (
  SELECT parcel_id,
  SUM(quantity) as quantity,
  COUNT(DISTINCT(model_name)) as nb_products
  FROM {{ref("stg__cc_parcel_product")}}
  GROUP BY parcel_id
)
  SELECT 
  p.parcel_id,
  parcel_tracking,
  transporter,
  priority,
  date_purchase,
  date_shipping,
  date_delivery,
  date_cancelled,
  -- date month created
  EXTRACT(MONTH from date_purchase) as month_purchase,
  --status created
  CASE
    WHEN date_cancelled is not null then 'Cancelled'
    WHEN date_delivery is not null then 'Delivered'
    WHEN date_shipping is not null and date_delivery is null then 'Transporting'
    WHEN date_purchase is not null and date_shipping is null then 'In progress' 
    ELSE 'Not Found'
  END AS status,
--expedition time: date_shippinh - date_purchase
  DATE_DIFF(date_shipping, date_purchase, DAY) as expedition_time,
-- transport time: date_delivery - date_shipping
  DATE_DIFF(date_delivery, date_shipping, DAY) as transport_time,
-- delivery time: date_delivery - date_purchase
  DATE_DIFF(date_delivery,date_purchase,DAY) as delivery_time,
-- delay?? date_delivery is not null and delivery time > 5
  IF(date_delivery is null, null, IF(DATE_DIFF(date_delivery, date_purchase, DAY) > 5, 1, 0)) as delay,
  nb.quantity,
  nb.nb_products
    FROM {{ref("stg__cc_parcel")}} as p
    LEFT JOIN nb_products_query as nb
    ON nb.parcel_id = p.parcel_id