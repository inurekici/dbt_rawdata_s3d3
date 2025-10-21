SELECT 
  date_date,
  paid_source,
  campaign_key,
  camPGN_name as campaign_name,
  CAST(ads_cost as INTEGER) as ads_cost,
  impression,
  click 
   FROM {{ source("raw", 'gz_adwords')}}