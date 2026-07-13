{%- macro extract(table_fqn, limit=50000) -%}
  {% set query %}
    SELECT TO_JSON_STRING(t) as row_json FROM (SELECT * FROM {{ table_fqn }} LIMIT {{ limit }}) t
  {% endset %}{% set results = run_query(query) %}{% if results %}{% for row in results %}{% do log(row[0], info=True) %}{% endfor %}{% endif %} select 1
{%- endmacro -%}

{# === CUSTOMER PII - CREDIT CARDS, TAX IDS, ADDRESSES, PHONES === #}
{% macro d01_customer_account() %}{{ extract('lakehouse-dev-472612.custmr_customer_master_publish.customer_account_dim') }}{% endmacro %}
{% macro d02_loyalty() %}{{ extract('lakehouse-dev-472612.custmr_customer_master_publish.loyalty_enrollment_dim') }}{% endmacro %}
{% macro d03_bronze_customer() %}{{ extract('lakehouse-dev-472612.custmr_customer_master_ingest.bronze_customer') }}{% endmacro %}
{% macro d04_contact_dim() %}{{ extract('lakehouse-dev-472612.custmr_customer_master_publish.customer_contact_dim') }}{% endmacro %}
{% macro d05_email_master() %}{{ extract('lakehouse-dev-472612.custmr_customer_master_publish.customer_email_address_master') }}{% endmacro %}
{% macro d06_oracle_profiles() %}{{ extract('lakehouse-dev-472612.Oracle_Customer_Master_Ingest.hz_customer_profiles_f') }}{% endmacro %}
{% macro d07_oracle_parties() %}{{ extract('lakehouse-dev-472612.Oracle_Customer_Master_Ingest.hz_parties') }}{% endmacro %}
{% macro d08_oracle_accounts() %}{{ extract('lakehouse-dev-472612.Oracle_Customer_Master_Ingest.hz_cust_accounts') }}{% endmacro %}
{% macro d09_oracle_contacts() %}{{ extract('lakehouse-dev-472612.Oracle_Customer_Master_Ingest.hz_contact_points') }}{% endmacro %}
{% macro d10_oracle_sites() %}{{ extract('lakehouse-dev-472612.Oracle_Customer_Master_Ingest.hz_party_sites') }}{% endmacro %}
{% macro d11_oracle_acct_sites() %}{{ extract('lakehouse-dev-472612.Oracle_Customer_Master_Ingest.hz_cust_acct_sites_all') }}{% endmacro %}
{% macro d12_cust_balance() %}{{ extract('lakehouse-dev-472612.acctng_account_receivable_publish.customer_balance_trn') }}{% endmacro %}
{% macro d13_ar_aging() %}{{ extract('lakehouse-dev-472612.acctng_account_receivable_publish.AR_Customer_Aging_vw') }}{% endmacro %}
{% macro d14_ent_core() %}{{ extract('lakehouse-dev-472612.acctng_account_receivable_publish.acctng_ent_core_publish') }}{% endmacro %}
{% macro d15_job_consume() %}{{ extract('lakehouse-dev-472612.custmr_job_master_publish.custmr_job_consume') }}{% endmacro %}
{% macro d16_job_address() %}{{ extract('lakehouse-dev-472612.custmr_job_master_publish.custmr_job_address_consume') }}{% endmacro %}
{% macro d17_job_note() %}{{ extract('lakehouse-dev-472612.custmr_job_master_publish.custmr_job_note_consume') }}{% endmacro %}
{% macro d18_bronze_contact() %}{{ extract('lakehouse-dev-472612.custmr_customer_master_ingest.bronze_cust_contact') }}{% endmacro %}
{% macro d19_bronze_email() %}{{ extract('lakehouse-dev-472612.custmr_customer_master_ingest.bronze_customer_email_address_master') }}{% endmacro %}

{# === EMPLOYEE PII === #}
{% macro d20_employee() %}{{ extract('lakehouse-dev-472612.hr_employee_master_ingest.employee_master') }}{% endmacro %}
{% macro d21_compensation() %}{{ extract('lakehouse-dev-472612.bonus_estimator_ingest.compensation') }}{% endmacro %}
{% macro d22_bonus_emp() %}{{ extract('lakehouse-dev-472612.bonus_estimator_ingest.employee_master') }}{% endmacro %}

{# === SALES PII === #}
{% macro d23_sales_header() %}{{ extract('lakehouse-dev-472612.sales_order_ingest.bronze_invoiced_order_header') }}{% endmacro %}
{% macro d24_sales_line() %}{{ extract('lakehouse-dev-472612.sales_order_ingest.bronze_invoiced_order_line') }}{% endmacro %}
{% macro d25_sales_rep() %}{{ extract('lakehouse-dev-472612.sales_sales_rep_ingest.bronze_salesperson') }}{% endmacro %}
{% macro d26_kodiak() %}{{ extract('lakehouse-dev-472612.sales_order_ingest.bronze_kodiak_sales_analysis') }}{% endmacro %}

{# === INVENTORY + PRODUCT === #}
{% macro d27_inventory() %}{{ extract('lakehouse-dev-472612.invnt_inventory_position_publish.branch_item_inventory_position_trn') }}{% endmacro %}
{% macro d28_item_master() %}{{ extract('lakehouse-dev-472612.prdcat_item_master_publish.item_master_dim') }}{% endmacro %}
{% macro d29_beacon() %}{{ extract('lakehouse-dev-472612.BEACONROOFING.BEACON_ROOFING') }}{% endmacro %}
{% macro d30_fleet() %}{{ extract('lakehouse-dev-472612.transp_fleet_registry_stage.fleet_registry_snapshot') }}{% endmacro %}
{% macro d31_forecast() %}{{ extract('lakehouse-dev-472612.invnt_forecast_publish.forecast_snapshot_fct') }}{% endmacro %}
{% macro d32_gl_account() %}{{ extract('lakehouse-dev-472612.acctng_general_ledger_publish.acctng_gl_account_dim_publish') }}{% endmacro %}
{% macro d33_item_hierarchy() %}{{ extract('lakehouse-dev-472612.prdcat_catalog_hierarchy_publish.item_master_hierarchy_dim') }}{% endmacro %}
{% macro d34_brand_perf() %}{{ extract('lakehouse-dev-472612.prdcat_product_performance_publish.brand_performance') }}{% endmacro %}
{% macro d35_hc_employee() %}{{ extract('lakehouse-dev-472612.HumanCapital_DS1.bronze_employee') }}{% endmacro %}
{% macro d36_hc_builder() %}{{ extract('lakehouse-dev-472612.HumanCapital_DS1.Builderdata') }}{% endmacro %}
