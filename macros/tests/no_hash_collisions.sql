{% test no_hash_collisions(model,column_name,hashed_fields) %} 
{{ config(severity='warn') }} 

WITH all_tuples AS (

    SELECT DISTINCT
        {{ column_name }} AS hash,
        {{ hashed_fields | join(', ') }}
    FROM {{ model }}

),

validation_errors AS (

    SELECT
        hash,
        COUNT(*) AS collision_count
    FROM all_tuples
    GROUP BY hash
    HAVING COUNT(*) > 1

)

SELECT *
FROM validation_errors

{% endtest %}