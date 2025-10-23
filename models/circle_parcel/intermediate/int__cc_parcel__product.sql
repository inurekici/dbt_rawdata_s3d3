SELECT 
parcel_id,
model_name,
  parcel_tracking,
  transporter,
  priority,
  date_purchase,
  date_shipping,
  date_delivery,
  date_cancelled,
  status,
  month_purchase,
qty,
expedition_time,
transport_time,
delivery_time,
delay,
nb_products,
FROM {{ref("int__cc_parcel")}}
RIGHT JOIN {{ ref("stg__cc_parcel_product")}}
USING (parcel_id)