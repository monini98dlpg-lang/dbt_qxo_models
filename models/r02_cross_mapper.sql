{{ config(materialized='ephemeral') }}
SELECT TO_JSON_STRING(t) as row_json FROM (
  SELECT * FROM lakehouse-dev-472612.gold_master_ds.cross_mapper_dim LIMIT 25000
) t
