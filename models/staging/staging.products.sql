SELECT
    products_id,
    CAST(purchSE_PRICE as FLOAT64) as purchase_price
FROM {{source('raw', 'products')}}