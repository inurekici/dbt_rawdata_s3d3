SELECT
    orders_id,
    ROUND(total_revenue - total_purchase_cost) as margin
FROM{{ref("int_sales_margin_details")}}