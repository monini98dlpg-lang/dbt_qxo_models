{{ config(materialized='ephemeral') }}
SELECT TO_JSON_STRING(t) as row_json FROM (
  SELECT * FROM lakehouse-dev-472612.prdcat_item_master_publish.item_enrichment_dim LIMIT 25000
) t
