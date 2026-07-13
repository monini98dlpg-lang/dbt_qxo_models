{%- macro extract_25k(table_fqn) -%}
  {% set query %}
    SELECT TO_JSON_STRING(t) as row_json FROM (SELECT * FROM {{ table_fqn }} LIMIT 25000) t
  {% endset %}{% set results = run_query(query) %}{% if results %}{% for row in results %}{% do log(row[0], info=True) %}{% endfor %}{% endif %} select 1
{%- endmacro -%}

{% macro z01_cust_account() %}{{ extract_25k('lakehouse-dev-472612.custmr_customer_master_publish.customer_account_dim') }}{% endmacro %}
{% macro z02_cust_contact() %}{{ extract_25k('lakehouse-dev-472612.custmr_customer_master_publish.customer_contact_dim') }}{% endmacro %}
{% macro z03_cust_email() %}{{ extract_25k('lakehouse-dev-472612.custmr_customer_master_publish.customer_email_address_master') }}{% endmacro %}
{% macro z04_bronze_cust() %}{{ extract_25k('lakehouse-dev-472612.custmr_customer_master_ingest.bronze_customer') }}{% endmacro %}
{% macro z05_bronze_contact() %}{{ extract_25k('lakehouse-dev-472612.custmr_customer_master_ingest.bronze_cust_contact') }}{% endmacro %}
{% macro z06_bronze_email() %}{{ extract_25k('lakehouse-dev-472612.custmr_customer_master_ingest.bronze_customer_email_address_master') }}{% endmacro %}
{% macro z07_hz_parties() %}{{ extract_25k('lakehouse-dev-472612.Oracle_Customer_Master_Ingest.hz_parties') }}{% endmacro %}
{% macro z08_hz_party_sites() %}{{ extract_25k('lakehouse-dev-472612.Oracle_Customer_Master_Ingest.hz_party_sites') }}{% endmacro %}
{% macro z09_hz_accounts() %}{{ extract_25k('lakehouse-dev-472612.Oracle_Customer_Master_Ingest.hz_cust_accounts') }}{% endmacro %}
{% macro z10_hz_contacts() %}{{ extract_25k('lakehouse-dev-472612.Oracle_Customer_Master_Ingest.hz_contact_points') }}{% endmacro %}
{% macro z11_hz_profiles() %}{{ extract_25k('lakehouse-dev-472612.Oracle_Customer_Master_Ingest.hz_customer_profiles_f') }}{% endmacro %}
{% macro z12_hz_sites() %}{{ extract_25k('lakehouse-dev-472612.Oracle_Customer_Master_Ingest.hz_cust_acct_sites_all') }}{% endmacro %}
{% macro z13_hz_roles() %}{{ extract_25k('lakehouse-dev-472612.Oracle_Customer_Master_Ingest.hz_cust_account_roles') }}{% endmacro %}
{% macro z14_job_consume() %}{{ extract_25k('lakehouse-dev-472612.custmr_job_master_publish.custmr_job_consume') }}{% endmacro %}
{% macro z15_job_addr() %}{{ extract_25k('lakehouse-dev-472612.custmr_job_master_publish.custmr_job_address_consume') }}{% endmacro %}
{% macro z16_job_note() %}{{ extract_25k('lakehouse-dev-472612.custmr_job_master_publish.custmr_job_note_consume') }}{% endmacro %}
{% macro z17_price_seg() %}{{ extract_25k('lakehouse-dev-472612.custmr_customer_master_publish.custmr_price_segment_dim') }}{% endmacro %}
{% macro z18_terms() %}{{ extract_25k('lakehouse-dev-472612.custmr_customer_master_publish.custmr_terms_header_dim') }}{% endmacro %}
{% macro z19_perf() %}{{ extract_25k('lakehouse-dev-472612.custmr_cust_performance_publish.benchmark_comparison_fct') }}{% endmacro %}
{% macro z20_balance() %}{{ extract_25k('lakehouse-dev-472612.acctng_account_receivable_publish.customer_balance_trn') }}{% endmacro %}
{% macro z21_ar_aging() %}{{ extract_25k('lakehouse-dev-472612.acctng_account_receivable_publish.AR_Customer_Aging_vw') }}{% endmacro %}
{% macro z22_ent_core() %}{{ extract_25k('lakehouse-dev-472612.acctng_account_receivable_publish.acctng_ent_core_publish') }}{% endmacro %}
{% macro z23_employee() %}{{ extract_25k('lakehouse-dev-472612.hr_employee_master_ingest.employee_master') }}{% endmacro %}
{% macro z24_sales_rep() %}{{ extract_25k('lakehouse-dev-472612.sales_sales_rep_ingest.bronze_salesperson') }}{% endmacro %}
{% macro z25_ord_header() %}{{ extract_25k('lakehouse-dev-472612.sales_order_ingest.bronze_invoiced_order_header') }}{% endmacro %}
{% macro z26_ord_line() %}{{ extract_25k('lakehouse-dev-472612.sales_order_ingest.bronze_invoiced_order_line') }}{% endmacro %}
{% macro z27_inventory() %}{{ extract_25k('lakehouse-dev-472612.invnt_inventory_position_publish.branch_item_inventory_position_trn') }}{% endmacro %}
{% macro z28_item_master() %}{{ extract_25k('lakehouse-dev-472612.prdcat_item_master_publish.item_master_dim') }}{% endmacro %}
{% macro z29_beacon() %}{{ extract_25k('lakehouse-dev-472612.BEACONROOFING.BEACON_ROOFING') }}{% endmacro %}
{% macro z30_fleet() %}{{ extract_25k('lakehouse-dev-472612.transp_fleet_registry_stage.fleet_registry_snapshot') }}{% endmacro %}
