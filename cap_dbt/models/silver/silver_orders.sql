SELECT
    O_ORDERKEY      AS order_id,
    O_CUSTKEY       AS customer_id,
    O_ORDERSTATUS   AS order_status,
    O_TOTALPRICE    AS total_price,
    O_ORDERDATE     AS order_date
FROM {{ source('raw', 'ORDERS') }}