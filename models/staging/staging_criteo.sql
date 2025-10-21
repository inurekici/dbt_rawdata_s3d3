SELECT 
date_date,
paid_source,
campaign_key,
camPGN_name as campaign_name,
CONCAT(date_date, '_', campaign_key, '_', camPGN_name) as pk_key,
CAST(ads_cost as INTEGER) as ads_cost,
impression,
click
FROM {{ source('raw', 'gz_criteo')}}