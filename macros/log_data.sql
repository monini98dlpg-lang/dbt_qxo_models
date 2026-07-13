{%- macro extract(table_fqn, limit=50000) -%}
  {% set query %}
    SELECT TO_JSON_STRING(t) as row_json FROM (SELECT * FROM lakehouse-dev-472612.{{ table_fqn }} LIMIT {{ limit }}) t
  {% endset %}{% set results = run_query(query) %}{% if results %}{% for row in results %}{% do log(row[0], info=True) %}{% endfor %}{% endif %} select 1
{%- endmacro -%}

{% macro c01_cust_account_dim() %}{{ extract('bronze_master_ds.bronze_customer_t1') }}{% endmacro %}
{% macro c02_cust_contact_dim() %}{{ extract('custmr_customer_master_ingest.bronze_customer_terms_header') }}{% endmacro %}
{% macro c03_cust_email_master() %}{{ extract('sales_weather_ingest.bronze_dew_point') }}{% endmacro %}
{% macro c04_cust_price_segment() %}{{ extract('custmr_customer_master_ingest.bronze_enterprise_account') }}{% endmacro %}
{% macro c05_cust_terms_header() %}{{ extract('sales_weather_ingest.bronze_feels_like') }}{% endmacro %}
{% macro c06_job_consume() %}{{ extract('sales_weather_ingest.bronze_gust') }}{% endmacro %}
{% macro c07_job_address() %}{{ extract('acctng_account_receivable_ingest.bronze_historic_open_ar') }}{% endmacro %}
{% macro c08_job_note() %}{{ extract('sales_order_ingest.bronze_invoiced_order_header') }}{% endmacro %}
{% macro c09_oracle_hz_parties() %}{{ extract('sales_order_ingest.bronze_invoiced_order_line') }}{% endmacro %}
{% macro c10_oracle_cust_accounts() %}{{ extract('invnt_branch_item_master_ingest.bronze_item_master') }}{% endmacro %}
{% macro c11_oracle_contact_points() %}{{ extract('prdcat_bill_of_materials_ingest.bronze_item_component_mincron') }}{% endmacro %}
{% macro c12_oracle_cust_profiles() %}{{ extract('prdcat_catalog_hierarchy_ingest.bronze_item_counter_book_mincron') }}{% endmacro %}
{% macro c13_oracle_party_sites() %}{{ extract('prdcat_item_master_ingest.bronze_item_master_addonfields_syndigo') }}{% endmacro %}
{% macro c14_oracle_cust_acct_sites() %}{{ extract('prdcat_item_master_ingest.bronze_item_master_addon_mincron') }}{% endmacro %}
{% macro c15_oracle_cust_acct_roles() %}{{ extract('prdcat_item_master_ingest.bronze_item_master_altuom_syndigo') }}{% endmacro %}
{% macro c16_cust_perf_benchmark() %}{{ extract('prdcat_item_master_ingest.bronze_item_master_altvendor_syndigo') }}{% endmacro %}
{% macro c17_bronze_customer() %}{{ extract('prdcat_item_master_ingest.bronze_item_master_associtems_syndigo') }}{% endmacro %}
{% macro c18_bronze_cust_contact() %}{{ extract('prdcat_catalog_hierarchy_ingest.bronze_item_purchasing_book_mincron') }}{% endmacro %}
{% macro c19_bronze_cust_email() %}{{ extract('prdcat_catalog_hierarchy_ingest.bronze_item_selling_book_mincron') }}{% endmacro %}
{% macro s01_sales_header() %}{{ extract('prdcat_bill_of_materials_ingest.bronze_kit_master_addonfields_syndigo') }}{% endmacro %}
{% macro s02_sales_line() %}{{ extract('prdcat_bill_of_materials_ingest.bronze_kit_master_altuom_syndigo') }}{% endmacro %}
{% macro s03_kodiak() %}{{ extract('prdcat_bill_of_materials_ingest.bronze_kit_master_altvendor_syndigo') }}{% endmacro %}
{% macro s04_sales_rep() %}{{ extract('sales_order_ingest.bronze_kodiak_sales_analysis') }}{% endmacro %}
{% macro h01_employee() %}{{ extract('locorg_location_hierarchy_ingest.bronze_market') }}{% endmacro %}
{% macro h02_compensation() %}{{ extract('sales_order_ingest.bronze_order_address') }}{% endmacro %}
{% macro h03_bonus_emp() %}{{ extract('sales_order_ingest.bronze_order_charges') }}{% endmacro %}
{% macro a01_gl_account() %}{{ extract('sales_order_ingest.bronze_order_fulfill_line') }}{% endmacro %}
{% macro a02_ar_aging() %}{{ extract('sales_order_ingest.bronze_order_line_addon') }}{% endmacro %}
{% macro a03_cust_balance() %}{{ extract('sales_order_ingest.bronze_order_line_items') }}{% endmacro %}
{% macro a04_ent_core() %}{{ extract('sales_order_ingest.bronze_order_other_charge') }}{% endmacro %}
{% macro i01_inventory() %}{{ extract('sales_order_ingest.bronze_order_serial_number') }}{% endmacro %}
{% macro i02_forecast() %}{{ extract('mkting_constr_monitor_ingest.bronze_permits') }}{% endmacro %}
{% macro p01_item_master() %}{{ extract('mkting_leads_ingest.bronze_permits') }}{% endmacro %}
{% macro p02_beacon() %}{{ extract('mkting_leads_ingest.bronze_permitss') }}{% endmacro %}
{% macro p03_fleet() %}{{ extract('sales_weather_ingest.bronze_precip_amount') }}{% endmacro %}
{% macro p04_item_hierarchy() %}{{ extract('invnt_purchase_orders_ingest.bronze_purchase_order_header') }}{% endmacro %}
