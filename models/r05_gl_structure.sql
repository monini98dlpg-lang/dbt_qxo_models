{{ config(materialized='ephemeral') }}
SELECT TO_JSON_STRING(t) as row_json FROM (
  SELECT * FROM lakehouse-dev-472612.acctng_general_ledger_publish.acctng_gl_financial_structure_dim_publish LIMIT 25000
) t
