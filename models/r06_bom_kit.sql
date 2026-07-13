{{ config(materialized='ephemeral') }}
SELECT TO_JSON_STRING(t) as row_json FROM (
  SELECT * FROM lakehouse-dev-472612.prdcat_bill_of_materials_publish.kit_master_addonfields_dim LIMIT 25000
) t
