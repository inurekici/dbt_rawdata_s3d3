SELECT 
    fd.date_date,
    fd.avg_revenue,
    fd.revenue,
    fd.purchase_cost,
    operational_margin - ads_cost as ads_margin,
    cd.ads_clicks,
    cd.ads_cost,
    cd.ads_impression,
    fd.margin,
    fd.operational_margin,
    fd.shipping_fee,
    fd.log_cost,
    fd.ship_cost,
FROM {{ ref("finance_days")}} as fd
FULL OUTER JOIN {{ ref("int_campaigns_day")}} as cd
USING (date_date)
ORDER BY date_date DESC