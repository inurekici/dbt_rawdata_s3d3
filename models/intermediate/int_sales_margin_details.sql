SELECT
    s.orders_id,
    SUM(revenue) as total_revenue,
    SUM(s.quantity * p.purchase_price) as total_purchase_cost
FROM {{source('raw', 'sales')}} as s
JOIN {{ ref('staging_products')}} as p
    ON s.pdt_id = p.products_id
GROUP BY 
    orders_id