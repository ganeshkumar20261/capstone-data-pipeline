SELECT
    N_NATION_KEY    AS nation_id,
    N_NAME          AS nation_name,
    N_REGIONKEY     AS region_id
FROM {{ source('raw', 'NATIONS') }}