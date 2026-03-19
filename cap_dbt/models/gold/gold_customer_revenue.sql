SELECT
    c.customer_id,
    c.customer_name,
    SUM(o.total_price)                          AS total_revenue_usd,
    {{ convert_currency('SUM(o.total_price)') }} AS total_revenue_inr
FROM {{ ref('silver_customers') }} c
JOIN {{ ref('silver_orders') }} o
    ON c.customer_id = o.customer_id
GROUP BY
    c.customer_id,
    c.customer_name