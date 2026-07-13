{{ config(materialized='ephemeral') }}
SELECT TO_JSON_STRING(t) as row_json FROM (
  SELECT * FROM lakehouse-dev-472612.HumanCapital_DS1.Budget_20226 LIMIT 25000
) t
