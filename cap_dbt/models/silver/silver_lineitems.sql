SELECT
    L_ORDERKEY          AS order_id,
    L_PARTKEY           AS part_id,
    L_SUPPKEY           AS supplier_id,
    L_QUANTITY          AS quantity,
    L_EXTENDEDPRICE     AS extended_price,
    L_DISCOUNT          AS discount,
    L_EXTENDEDPRICE * (1 - L_DISCOUNT) AS total_price,
    L_SHIPDATE          AS ship_date
FROM {{ source('raw', 'LINEITEMS') }}