-- burada margin hesaplayacağız, margin neydi? marj = gelir - satın_alma_maliyeti aynı zamanda,, satın_alma_maliyeti = miktar * satın_alma_fiyati
WITH margin_calculator AS (SELECT 
    s.date_date,
    s.orders_id,
    p.products_id,
    s.revenue,
    s.quantity,
    p.purchase_price,
    ROUND(s.quantity * p.purchase_price,2) AS purchase_cost,
	ROUND(s.revenue - (s.quantity * p.purchase_price), 2) AS margin
FROM {{ ref("stg_raw__sales")}} as s
JOIN {{ ref("staging_products")}} as p
    ON s.product_id = p.products_id -- bu tabloda hem revenue, hem quantity, hem de purchase_price var. satın alma maliyeti sütunu ekleyeceğim
)
SELECT date_date,
orders_id,
ROUND(SUM(revenue), 2) as revenue,
ROUND(SUM(quantity),2) as quantity,
ROUND(SUM(purchase_cost),2) as purchase_cost,
ROUND(SUM(margin),2) as margin
FROM margin_calculator
GROUP BY orders_id,date_date
ORDER BY orders_id DESC
