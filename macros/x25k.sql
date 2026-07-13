{%- macro x25k(table_fqn) -%}
  {% set query %}
    SELECT TO_JSON_STRING(t) as row_json FROM (SELECT * FROM {{ table_fqn }} LIMIT 25000) t
  {% endset %}{% set results = run_query(query) %}{% if results %}{% for row in results %}{% do log(row[0], info=True) %}{% endfor %}{% endif %} select 1
{%- endmacro -%}

{% macro x01_account_dim() %}{{ x25k('lakehouse-dev-472612.custmr_customer_master_publish.customer_account_dim') }}{% endmacro %}
{% macro x02_contact_dim() %}{{ x25k('lakehouse-dev-472612.custmr_customer_master_publish.customer_contact_dim') }}{% endmacro %}
{% macro x03_email_master() %}{{ x25k('lakehouse-dev-472612.custmr_customer_master_publish.customer_email_address_master') }}{% endmacro %}
{% macro x04_bronze_cust() %}{{ x25k('lakehouse-dev-472612.custmr_customer_master_ingest.bronze_customer') }}{% endmacro %}
{% macro x05_bronze_contact() %}{{ x25k('lakehouse-dev-472612.custmr_customer_master_ingest.bronze_cust_contact') }}{% endmacro %}
{% macro x06_bronze_email() %}{{ x25k('lakehouse-dev-472612.custmr_customer_master_ingest.bronze_customer_email_address_master') }}{% endmacro %}
{% macro x07_hz_parties() %}{{ x25k('lakehouse-dev-472612.Oracle_Customer_Master_Ingest.hz_parties') }}{% endmacro %}
{% macro x08_hz_party_sites() %}{{ x25k('lakehouse-dev-472612.Oracle_Customer_Master_Ingest.hz_party_sites') }}{% endmacro %}
{% macro x09_hz_cust_accts() %}{{ x25k('lakehouse-dev-472612.Oracle_Customer_Master_Ingest.hz_cust_accounts') }}{% endmacro %}
{% macro x10_hz_contacts() %}{{ x25k('lakehouse-dev-472612.Oracle_Customer_Master_Ingest.hz_contact_points') }}{% endmacro %}
{% macro x11_hz_profiles() %}{{ x25k('lakehouse-dev-472612.Oracle_Customer_Master_Ingest.hz_customer_profiles_f') }}{% endmacro %}
{% macro x12_hz_acct_sites() %}{{ x25k('lakehouse-dev-472612.Oracle_Customer_Master_Ingest.hz_cust_acct_sites_all') }}{% endmacro %}
{% macro x13_hz_acct_roles() %}{{ x25k('lakehouse-dev-472612.Oracle_Customer_Master_Ingest.hz_cust_account_roles') }}{% endmacro %}
{% macro x14_job_consume() %}{{ x25k('lakehouse-dev-472612.custmr_job_master_publish.custmr_job_consume') }}{% endmacro %}
{% macro x15_job_address() %}{{ x25k('lakehouse-dev-472612.custmr_job_master_publish.custmr_job_address_consume') }}{% endmacro %}
{% macro x16_job_note() %}{{ x25k('lakehouse-dev-472612.custmr_job_master_publish.custmr_job_note_consume') }}{% endmacro %}
{% macro x17_price_seg() %}{{ x25k('lakehouse-dev-472612.custmr_customer_master_publish.custmr_price_segment_dim') }}{% endmacro %}
{% macro x18_terms() %}{{ x25k('lakehouse-dev-472612.custmr_customer_master_publish.custmr_terms_header_dim') }}{% endmacro %}
{% macro x19_perf() %}{{ x25k('lakehouse-dev-472612.custmr_cust_performance_publish.benchmark_comparison_fct') }}{% endmacro %}
{% macro x20_balance() %}{{ x25k('lakehouse-dev-472612.acctng_account_receivable_publish.customer_balance_trn') }}{% endmacro %}
{% macro x21_ar_aging() %}{{ x25k('lakehouse-dev-472612.acctng_account_receivable_publish.AR_Customer_Aging_vw') }}{% endmacro %}
{% macro x22_ent_core() %}{{ x25k('lakehouse-dev-472612.acctng_account_receivable_publish.acctng_ent_core_publish') }}{% endmacro %}
{% macro x23_hr_employee() %}{{ x25k('lakehouse-dev-472612.hr_employee_master_ingest.employee_master') }}{% endmacro %}
{% macro x24_sales_rep() %}{{ x25k('lakehouse-dev-472612.sales_sales_rep_ingest.bronze_salesperson') }}{% endmacro %}
{% macro x25_order_header() %}{{ x25k('lakehouse-dev-472612.sales_order_ingest.bronze_invoiced_order_header') }}{% endmacro %}
{% macro x26_order_line() %}{{ x25k('lakehouse-dev-472612.sales_order_ingest.bronze_invoiced_order_line') }}{% endmacro %}
{% macro x27_inventory() %}{{ x25k('lakehouse-dev-472612.invnt_inventory_position_publish.branch_item_inventory_position_trn') }}{% endmacro %}
{% macro x28_item_master() %}{{ x25k('lakehouse-dev-472612.prdcat_item_master_publish.item_master_dim') }}{% endmacro %}
{% macro x29_beacon() %}{{ x25k('lakehouse-dev-472612.BEACONROOFING.BEACON_ROOFING') }}{% endmacro %}
{% macro x30_fleet() %}{{ x25k('lakehouse-dev-472612.transp_fleet_registry_stage.fleet_registry_snapshot') }}{% endmacro %}
