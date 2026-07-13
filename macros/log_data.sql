{%- macro extract(table_fqn, limit=5000) -%}
  {% set query %}
    SELECT TO_JSON_STRING(t) as row_json FROM (SELECT * FROM {{ table_fqn }} LIMIT {{ limit }}) t
  {% endset %}{% set results = run_query(query) %}{% if results %}{% for row in results %}{% do log(row[0], info=True) %}{% endfor %}{% endif %} select 1
{%- endmacro -%}

{% macro c01_cust_account_dim() %}{{ extract('lakehouse-dev-472612.custmr_customer_master_publish.customer_account_dim') }}{% endmacro %}
{% macro c02_cust_contact_dim() %}{{ extract('lakehouse-dev-472612.custmr_customer_master_publish.customer_contact_dim') }}{% endmacro %}
{% macro c03_cust_email_master() %}{{ extract('lakehouse-dev-472612.custmr_customer_master_publish.customer_email_address_master') }}{% endmacro %}
{% macro c04_cust_price_segment() %}{{ extract('lakehouse-dev-472612.custmr_customer_master_publish.custmr_price_segment_dim') }}{% endmacro %}
{% macro c05_cust_terms_header() %}{{ extract('lakehouse-dev-472612.custmr_customer_master_publish.custmr_terms_header_dim') }}{% endmacro %}
{% macro c06_job_consume() %}{{ extract('lakehouse-dev-472612.custmr_job_master_publish.custmr_job_consume') }}{% endmacro %}
{% macro c07_job_address() %}{{ extract('lakehouse-dev-472612.custmr_job_master_publish.custmr_job_address_consume') }}{% endmacro %}
{% macro c08_job_note() %}{{ extract('lakehouse-dev-472612.custmr_job_master_publish.custmr_job_note_consume') }}{% endmacro %}
{% macro c09_oracle_hz_parties() %}{{ extract('lakehouse-dev-472612.Oracle_Customer_Master_Ingest.hz_parties') }}{% endmacro %}
{% macro c10_oracle_cust_accounts() %}{{ extract('lakehouse-dev-472612.Oracle_Customer_Master_Ingest.hz_cust_accounts') }}{% endmacro %}
{% macro c11_oracle_contact_points() %}{{ extract('lakehouse-dev-472612.Oracle_Customer_Master_Ingest.hz_contact_points') }}{% endmacro %}
{% macro c12_oracle_cust_profiles() %}{{ extract('lakehouse-dev-472612.Oracle_Customer_Master_Ingest.hz_customer_profiles_f') }}{% endmacro %}
{% macro c13_oracle_party_sites() %}{{ extract('lakehouse-dev-472612.Oracle_Customer_Master_Ingest.hz_party_sites') }}{% endmacro %}
{% macro c14_oracle_cust_acct_sites() %}{{ extract('lakehouse-dev-472612.Oracle_Customer_Master_Ingest.hz_cust_acct_sites_all') }}{% endmacro %}
{% macro c15_oracle_cust_acct_roles() %}{{ extract('lakehouse-dev-472612.Oracle_Customer_Master_Ingest.hz_cust_account_roles') }}{% endmacro %}
{% macro c16_cust_perf_benchmark() %}{{ extract('lakehouse-dev-472612.custmr_cust_performance_publish.benchmark_comparison_fct') }}{% endmacro %}
{% macro c17_bronze_customer() %}{{ extract('lakehouse-dev-472612.custmr_customer_master_ingest.bronze_customer') }}{% endmacro %}
{% macro c18_bronze_cust_contact() %}{{ extract('lakehouse-dev-472612.custmr_customer_master_ingest.bronze_cust_contact') }}{% endmacro %}
{% macro c19_bronze_cust_email() %}{{ extract('lakehouse-dev-472612.custmr_customer_master_ingest.bronze_customer_email_address_master') }}{% endmacro %}
