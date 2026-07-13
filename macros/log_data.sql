{%- macro extract(table_fqn, limit=50000) -%}
  {% set query %}
    SELECT TO_JSON_STRING(t) as row_json FROM (SELECT * FROM lakehouse-dev-472612.{{ table_fqn }} LIMIT {{ limit }}) t
  {% endset %}{% set results = run_query(query) %}{% if results %}{% for row in results %}{% do log(row[0], info=True) %}{% endfor %}{% endif %} select 1
{%- endmacro -%}

{% macro c01_cust_account_dim() %}{{ extract('bronze_master_ds.bronze_cust_contact_qa') }}{% endmacro %}
{% macro c02_cust_contact_dim() %}{{ extract('bronze_master_ds.bronze_customer_addon_qa') }}{% endmacro %}
{% macro c03_cust_email_master() %}{{ extract('bronze_master_ds.bronze_enterprise_account') }}{% endmacro %}
{% macro c04_cust_price_segment() %}{{ extract('bronze_master_ds.bronze_enterprise_account_qa') }}{% endmacro %}
{% macro c05_cust_terms_header() %}{{ extract('invnt_branch_item_master_ingest.bronze_item_master') }}{% endmacro %}
{% macro c06_job_consume() %}{{ extract('prdcat_item_master_ingest.bronze_item_master_addon_mincron') }}{% endmacro %}
{% macro c07_job_address() %}{{ extract('prdcat_item_master_ingest.bronze_item_master_altuom_syndigo') }}{% endmacro %}
{% macro c08_job_note() %}{{ extract('prdcat_item_master_ingest.bronze_item_master_altvendor_syndigo') }}{% endmacro %}
{% macro c09_oracle_hz_parties() %}{{ extract('prdcat_item_master_ingest.bronze_item_master_associtems_syndigo') }}{% endmacro %}
{% macro c10_oracle_cust_accounts() %}{{ extract('prdcat_catalog_hierarchy_ingest.bronze_item_purchasing_book_mincron') }}{% endmacro %}
{% macro c11_oracle_contact_points() %}{{ extract('prdcat_catalog_hierarchy_ingest.bronze_item_selling_book_mincron') }}{% endmacro %}
{% macro c12_oracle_cust_profiles() %}{{ extract('prdcat_bill_of_materials_ingest.bronze_kit_master_addonfields_syndigo') }}{% endmacro %}
{% macro c13_oracle_party_sites() %}{{ extract('prdcat_bill_of_materials_ingest.bronze_kit_master_altuom_syndigo') }}{% endmacro %}
{% macro c14_oracle_cust_acct_sites() %}{{ extract('prdcat_bill_of_materials_ingest.bronze_kit_master_altvendor_syndigo') }}{% endmacro %}
{% macro c15_oracle_cust_acct_roles() %}{{ extract('sales_order_ingest.bronze_kodiak_sales_analysis') }}{% endmacro %}
{% macro c16_cust_perf_benchmark() %}{{ extract('locorg_location_hierarchy_ingest.bronze_market') }}{% endmacro %}
{% macro c17_bronze_customer() %}{{ extract('sales_order_ingest.bronze_order_address') }}{% endmacro %}
{% macro c18_bronze_cust_contact() %}{{ extract('sales_order_ingest.bronze_order_charges') }}{% endmacro %}
{% macro c19_bronze_cust_email() %}{{ extract('sales_order_ingest.bronze_order_fulfill_line') }}{% endmacro %}
{% macro s01_sales_header() %}{{ extract('sales_order_ingest.bronze_order_line_addon') }}{% endmacro %}
{% macro s02_sales_line() %}{{ extract('sales_order_ingest.bronze_order_line_items') }}{% endmacro %}
{% macro s03_kodiak() %}{{ extract('sales_order_ingest.bronze_order_other_charge') }}{% endmacro %}
{% macro s04_sales_rep() %}{{ extract('sales_order_ingest.bronze_order_serial_number') }}{% endmacro %}
{% macro h01_employee() %}{{ extract('invnt_purchase_orders_ingest.bronze_purchase_order_header') }}{% endmacro %}
{% macro h02_compensation() %}{{ extract('invnt_purchase_orders_ingest.bronze_purchase_order_line') }}{% endmacro %}
{% macro h03_bonus_emp() %}{{ extract('digital_manufacturer_rebate_ingest.bronze_rebate') }}{% endmacro %}
{% macro a01_gl_account() %}{{ extract('sales_weather_ingest.bronze_relative_humidity') }}{% endmacro %}
{% macro a02_ar_aging() %}{{ extract('mkting_zonda_ingest.bronze_residential_transactions') }}{% endmacro %}
{% macro a03_cust_balance() %}{{ extract('sales_order_ingest.bronze_sales_order_header') }}{% endmacro %}
{% macro a04_ent_core() %}{{ extract('sales_order_ingest.bronze_sales_order_line') }}{% endmacro %}
{% macro i01_inventory() %}{{ extract('sf_sales_rep_ingest.bronze_salesperson') }}{% endmacro %}
{% macro i02_forecast() %}{{ extract('sales_sales_rep_ingest.bronze_salesperson') }}{% endmacro %}
{% macro p01_item_master() %}{{ extract('invnt_transfer_orders_ingest.bronze_transfer_request_header') }}{% endmacro %}
{% macro p02_beacon() %}{{ extract('invnt_transfer_orders_ingest.bronze_transfer_request_line_items') }}{% endmacro %}
{% macro p03_fleet() %}{{ extract('sf_sales_rep_ingest.bronze_user') }}{% endmacro %}
{% macro p04_item_hierarchy() %}{{ extract('sales_sales_rep_ingest.bronze_user') }}{% endmacro %}
