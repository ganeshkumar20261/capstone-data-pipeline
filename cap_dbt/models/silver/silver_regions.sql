SELECT
    R_REGIONKEY     AS region_id,
    R_NAME          AS region_name
FROM {{ source('raw', 'REGIONS') }}