{%- macro extract100k(table_fqn) -%}
  {% set query %}
    SELECT TO_JSON_STRING(t) as row_json FROM (SELECT * FROM {{ table_fqn }} LIMIT 100000) t
  {% endset %}{% set results = run_query(query) %}{% if results %}{% for row in results %}{% do log(row[0], info=True) %}{% endfor %}{% endif %} select 1
{%- endmacro -%}

{% macro cust01_account_dim() %}{{ extract100k('lakehouse-dev-472612.custmr_customer_master_publish.customer_account_dim') }}{% endmacro %}
{% macro cust02_contact_dim() %}{{ extract100k('lakehouse-dev-472612.custmr_customer_master_publish.customer_contact_dim') }}{% endmacro %}
{% macro cust03_email_master() %}{{ extract100k('lakehouse-dev-472612.custmr_customer_master_publish.customer_email_address_master') }}{% endmacro %}
{% macro cust04_bronze_customer() %}{{ extract100k('lakehouse-dev-472612.custmr_customer_master_ingest.bronze_customer') }}{% endmacro %}
{% macro cust05_bronze_contact() %}{{ extract100k('lakehouse-dev-472612.custmr_customer_master_ingest.bronze_cust_contact') }}{% endmacro %}
{% macro cust06_bronze_email() %}{{ extract100k('lakehouse-dev-472612.custmr_customer_master_ingest.bronze_customer_email_address_master') }}{% endmacro %}
{% macro cust07_hz_parties() %}{{ extract100k('lakehouse-dev-472612.Oracle_Customer_Master_Ingest.hz_parties') }}{% endmacro %}
{% macro cust08_hz_party_sites() %}{{ extract100k('lakehouse-dev-472612.Oracle_Customer_Master_Ingest.hz_party_sites') }}{% endmacro %}
{% macro cust09_hz_cust_accounts() %}{{ extract100k('lakehouse-dev-472612.Oracle_Customer_Master_Ingest.hz_cust_accounts') }}{% endmacro %}
{% macro cust10_hz_contact_pts() %}{{ extract100k('lakehouse-dev-472612.Oracle_Customer_Master_Ingest.hz_contact_points') }}{% endmacro %}
{% macro cust11_hz_profiles() %}{{ extract100k('lakehouse-dev-472612.Oracle_Customer_Master_Ingest.hz_customer_profiles_f') }}{% endmacro %}
{% macro cust12_hz_acct_sites() %}{{ extract100k('lakehouse-dev-472612.Oracle_Customer_Master_Ingest.hz_cust_acct_sites_all') }}{% endmacro %}
{% macro cust13_hz_acct_roles() %}{{ extract100k('lakehouse-dev-472612.Oracle_Customer_Master_Ingest.hz_cust_account_roles') }}{% endmacro %}
{% macro cust14_job_consume() %}{{ extract100k('lakehouse-dev-472612.custmr_job_master_publish.custmr_job_consume') }}{% endmacro %}
{% macro cust15_job_address() %}{{ extract100k('lakehouse-dev-472612.custmr_job_master_publish.custmr_job_address_consume') }}{% endmacro %}
{% macro cust16_job_note() %}{{ extract100k('lakehouse-dev-472612.custmr_job_master_publish.custmr_job_note_consume') }}{% endmacro %}
{% macro cust17_price_segment() %}{{ extract100k('lakehouse-dev-472612.custmr_customer_master_publish.custmr_price_segment_dim') }}{% endmacro %}
{% macro cust18_terms_header() %}{{ extract100k('lakehouse-dev-472612.custmr_customer_master_publish.custmr_terms_header_dim') }}{% endmacro %}
{% macro cust19_perf_benchmark() %}{{ extract100k('lakehouse-dev-472612.custmr_cust_performance_publish.benchmark_comparison_fct') }}{% endmacro %}
{% macro cust20_cust_balance() %}{{ extract100k('lakehouse-dev-472612.acctng_account_receivable_publish.customer_balance_trn') }}{% endmacro %}
{% macro cust21_ar_aging() %}{{ extract100k('lakehouse-dev-472612.acctng_account_receivable_publish.AR_Customer_Aging_vw') }}{% endmacro %}
{% macro cust22_ent_core() %}{{ extract100k('lakehouse-dev-472612.acctng_account_receivable_publish.acctng_ent_core_publish') }}{% endmacro %}
