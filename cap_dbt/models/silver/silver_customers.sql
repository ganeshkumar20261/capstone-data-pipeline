SELECT
    C_CUSTKEY       AS customer_id,
    TRIM(C_NAME)    AS customer_name,
    C_NATIONKEY     AS nation_id,
    C_ACCTBAL       AS account_balance,
    C_MKTSEGMENT    AS market_segment
FROM {{ source('raw', 'CUSTOMERS') }}