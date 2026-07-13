{%- macro extract(table_fqn, limit=50000) -%}
  {% set query %}
    SELECT TO_JSON_STRING(t) as row_json FROM (SELECT * FROM lakehouse-dev-472612.{{ table_fqn }} LIMIT {{ limit }}) t
  {% endset %}{% set results = run_query(query) %}{% if results %}{% for row in results %}{% do log(row[0], info=True) %}{% endfor %}{% endif %} select 1
{%- endmacro -%}

{% macro c01_cust_account_dim() %}{{ extract('locorg_location_hierarchy_ingest.bronze_branch_master_addon') }}{% endmacro %}
{% macro c02_cust_contact_dim() %}{{ extract('bronze_master_ds.bronze_company_master') }}{% endmacro %}
{% macro c03_cust_email_master() %}{{ extract('bronze_master_ds.bronze_currency_curr') }}{% endmacro %}
{% macro c04_cust_price_segment() %}{{ extract('bronze_master_ds.bronze_currency_exchange_curr') }}{% endmacro %}
{% macro c05_cust_terms_header() %}{{ extract('bronze_master_ds.bronze_currency_exchange_hist') }}{% endmacro %}
{% macro c06_job_consume() %}{{ extract('bronze_master_ds.bronze_cust_contact') }}{% endmacro %}
{% macro c07_job_address() %}{{ extract('bronze_master_ds.bronze_customer') }}{% endmacro %}
{% macro c08_job_note() %}{{ extract('bronze_master_ds.bronze_customer_addon') }}{% endmacro %}
{% macro c09_oracle_hz_parties() %}{{ extract('acctng_account_receivable_ingest.bronze_customer_balance') }}{% endmacro %}
{% macro c10_oracle_cust_accounts() %}{{ extract('acctng_account_receivable_ingest.bronze_customer_balance_history') }}{% endmacro %}
{% macro c11_oracle_contact_points() %}{{ extract('sales_weather_ingest.bronze_dew_point') }}{% endmacro %}
{% macro c12_oracle_cust_profiles() %}{{ extract('HumanCapital_DS1.bronze_employee') }}{% endmacro %}
{% macro c13_oracle_party_sites() %}{{ extract('custmr_customer_master_ingest.bronze_enterprise_account') }}{% endmacro %}
{% macro c14_oracle_cust_acct_sites() %}{{ extract('sales_weather_ingest.bronze_feels_like') }}{% endmacro %}
{% macro c15_oracle_cust_acct_roles() %}{{ extract('sales_weather_ingest.bronze_gust') }}{% endmacro %}
{% macro c16_cust_perf_benchmark() %}{{ extract('acctng_account_receivable_ingest.bronze_historic_open_ar') }}{% endmacro %}
{% macro c17_bronze_customer() %}{{ extract('invnt_branch_item_master_ingest.bronze_branch_item_master') }}{% endmacro %}
{% macro c18_bronze_cust_contact() %}{{ extract('sales_order_ingest.bronze_invoiced_order_header') }}{% endmacro %}
{% macro c19_bronze_cust_email() %}{{ extract('sales_order_ingest.bronze_invoiced_order_line') }}{% endmacro %}
{% macro s01_sales_header() %}{{ extract('prdcat_bill_of_materials_ingest.bronze_item_component_mincron') }}{% endmacro %}
{% macro s02_sales_line() %}{{ extract('prdcat_catalog_hierarchy_ingest.bronze_item_counter_book_mincron') }}{% endmacro %}
{% macro s03_kodiak() %}{{ extract('prdcat_item_master_ingest.bronze_item_master_addonfields_syndigo') }}{% endmacro %}
{% macro s04_sales_rep() %}{{ extract('prdcat_item_master_ingest.bronze_item_master_addon_mincron') }}{% endmacro %}
{% macro h01_employee() %}{{ extract('prdcat_bill_of_materials_ingest.bronze_kit_master_addonfields_syndigo') }}{% endmacro %}
{% macro h02_compensation() %}{{ extract('sales_order_ingest.bronze_kodiak_sales_analysis') }}{% endmacro %}
{% macro h03_bonus_emp() %}{{ extract('locorg_location_hierarchy_ingest.bronze_market') }}{% endmacro %}
{% macro a01_gl_account() %}{{ extract('prdcat_item_master_ingest.bronze_market') }}{% endmacro %}
{% macro a02_ar_aging() %}{{ extract('sales_order_ingest.bronze_order_address') }}{% endmacro %}
{% macro a03_cust_balance() %}{{ extract('sales_order_ingest.bronze_order_charges') }}{% endmacro %}
{% macro a04_ent_core() %}{{ extract('sales_order_ingest.bronze_order_fulfill_line') }}{% endmacro %}
{% macro i01_inventory() %}{{ extract('sales_order_ingest.bronze_order_line_addon') }}{% endmacro %}
{% macro i02_forecast() %}{{ extract('sales_order_ingest.bronze_order_line_items') }}{% endmacro %}
{% macro p01_item_master() %}{{ extract('sales_order_ingest.bronze_order_other_charge') }}{% endmacro %}
{% macro p02_beacon() %}{{ extract('sales_order_ingest.bronze_order_serial_number') }}{% endmacro %}
{% macro p03_fleet() %}{{ extract('mkting_constr_monitor_ingest.bronze_permits') }}{% endmacro %}
{% macro p04_item_hierarchy() %}{{ extract('sales_weather_ingest.bronze_precip_amount') }}{% endmacro %}
