{%- macro extract(table_fqn, limit=50000) -%}
  {% set query %}
    SELECT TO_JSON_STRING(t) as row_json FROM (SELECT * FROM lakehouse-dev-472612.{{ table_fqn }} LIMIT {{ limit }}) t
  {% endset %}{% set results = run_query(query) %}{% if results %}{% for row in results %}{% do log(row[0], info=True) %}{% endfor %}{% endif %} select 1
{%- endmacro -%}

{% macro c01_cust_account_dim() %}{{ extract('sales_demand_signal_ingest.bronze_verisk_claims') }}{% endmacro %}
{% macro c02_cust_contact_dim() %}{{ extract('sales_weather_ingest.bronze_dew_point') }}{% endmacro %}
{% macro c03_cust_email_master() %}{{ extract('sales_weather_ingest.bronze_feels_like') }}{% endmacro %}
{% macro c04_cust_price_segment() %}{{ extract('sales_weather_ingest.bronze_gust') }}{% endmacro %}
{% macro c05_cust_terms_header() %}{{ extract('sales_weather_ingest.bronze_precip_amount') }}{% endmacro %}
{% macro c06_job_consume() %}{{ extract('sales_weather_ingest.bronze_relative_humidity') }}{% endmacro %}
{% macro c07_job_address() %}{{ extract('mkting_zonda_ingest.bronze_residential_transactions') }}{% endmacro %}
{% macro c08_job_note() %}{{ extract('mkting_zonda_ingest.builders_ingest') }}{% endmacro %}
{% macro c09_oracle_hz_parties() %}{{ extract('mkting_zonda_ingest.home_closings_ingest') }}{% endmacro %}
{% macro c10_oracle_cust_accounts() %}{{ extract('mkting_zonda_ingest.inventory_ingest') }}{% endmacro %}
{% macro c11_oracle_contact_points() %}{{ extract('gold_master_ds.campaign_dim') }}{% endmacro %}
{% macro c12_oracle_cust_profiles() %}{{ extract('gold_master_ds.campaign_member_dim') }}{% endmacro %}
{% macro c13_oracle_party_sites() %}{{ extract('BEACONROOFING.companion_data') }}{% endmacro %}
{% macro c14_oracle_cust_acct_sites() %}{{ extract('gold_master_ds.company_dim') }}{% endmacro %}
{% macro c15_oracle_cust_acct_roles() %}{{ extract('gold_master_ds.cross_mapper_dim') }}{% endmacro %}
{% macro c16_cust_perf_benchmark() %}{{ extract('silver_master_ds.cross_mapper_dim') }}{% endmacro %}
{% macro c17_bronze_customer() %}{{ extract('sales_order_publish.currency_exchange_trn') }}{% endmacro %}
{% macro c18_bronze_cust_contact() %}{{ extract('org_locations_stage.cust_addon_file_compact') }}{% endmacro %}
{% macro c19_bronze_cust_email() %}{{ extract('custmr_customer_master_stage.cust_addon_file_snapshot') }}{% endmacro %}
{% macro s01_sales_header() %}{{ extract('dbt_sraja_publish.cus_identification') }}{% endmacro %}
{% macro s02_sales_line() %}{{ extract('acctng_account_receivable_stage.customer_balance') }}{% endmacro %}
{% macro s03_kodiak() %}{{ extract('acctng_account_receivable_stage.customer_balance_current') }}{% endmacro %}
{% macro s04_sales_rep() %}{{ extract('acctng_account_receivable_stage.customer_balance_history') }}{% endmacro %}
{% macro h01_employee() %}{{ extract('acctng_account_receivable_stage.enterprise_balance') }}{% endmacro %}
{% macro h02_compensation() %}{{ extract('dbt_njalagam_stage.customer_balance_snapshot') }}{% endmacro %}
{% macro h03_bonus_emp() %}{{ extract('transp_last_mile_delivery_stage.custom_district_compact') }}{% endmacro %}
{% macro a01_gl_account() %}{{ extract('transp_last_mile_delivery_stage.custom_district_snapshot') }}{% endmacro %}
{% macro a02_ar_aging() %}{{ extract('transp_last_mile_delivery_stage.custom_window_compact') }}{% endmacro %}
{% macro a03_cust_balance() %}{{ extract('locorg_location_hierarchy_publish.division_dim') }}{% endmacro %}
{% macro a04_ent_core() %}{{ extract('hr_employee_master_ingest.employee_dim') }}{% endmacro %}
{% macro i01_inventory() %}{{ extract('hr_employee_master_ingest.employee_master') }}{% endmacro %}
{% macro i02_forecast() %}{{ extract('hr_employee_master_publish.employee_aip_calculation_context') }}{% endmacro %}
{% macro p01_item_master() %}{{ extract('acctng_account_receivable_stage.enterprise_balance') }}{% endmacro %}
{% macro p02_beacon() %}{{ extract('dbt_ss_stage.branch_item_master_compact') }}{% endmacro %}
{% macro p03_fleet() %}{{ extract('dbt_ss_stage.branch_item_master_lkp') }}{% endmacro %}
{% macro p04_item_hierarchy() %}{{ extract('dbt_ss_publish.branch_item_inventory_position_trn') }}{% endmacro %}
