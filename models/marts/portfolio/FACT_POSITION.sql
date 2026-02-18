

{{ config(materialized='ephemeral') }}

----------------- 

SELECT
    *
FROM
    {{ref('REF_POSITION_ABC_BANK')}}