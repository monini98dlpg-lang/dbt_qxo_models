{{ config(materialized='table') }}

SELECT 
  *
FROM {{ source('hr_employee_master_ingest', 'employee_master') }}
LIMIT 5000
