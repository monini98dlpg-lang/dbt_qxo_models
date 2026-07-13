{%- macro extract(table_fqn, limit=50000) -%}
  {% set query %}
    SELECT TO_JSON_STRING(t) as row_json FROM (SELECT * FROM lakehouse-dev-472612.{{ table_fqn }} LIMIT {{ limit }}) t
  {% endset %}{% set results = run_query(query) %}{% if results %}{% for row in results %}{% do log(row[0], info=True) %}{% endfor %}{% endif %} select 1
{%- endmacro -%}

{% macro c01_cust_account_dim() %}{{ extract('HumanCapital_DS1.Builderdata') }}{% endmacro %}
{% macro c02_cust_contact_dim() %}{{ extract('HumanCapital_DS1.Budget_20226') }}{% endmacro %}
{% macro c03_cust_email_master() %}{{ extract('iteng_master_ref_publish.calendar_dim') }}{% endmacro %}
{% macro c04_cust_price_segment() %}{{ extract('gold_master_ds.campaign_dim') }}{% endmacro %}
{% macro c05_cust_terms_header() %}{{ extract('silver_master_ds.campaign_dim') }}{% endmacro %}
{% macro c06_job_consume() %}{{ extract('gold_master_ds.campaign_member_dim') }}{% endmacro %}
{% macro c07_job_address() %}{{ extract('silver_master_ds.campaign_member_dim') }}{% endmacro %}
{% macro c08_job_note() %}{{ extract('gold_master_ds.company_dim') }}{% endmacro %}
{% macro c09_oracle_hz_parties() %}{{ extract('silver_master_ds.company_dim') }}{% endmacro %}
{% macro c10_oracle_cust_accounts() %}{{ extract('locorg_location_hierarchy_publish.company_dim') }}{% endmacro %}
{% macro c11_oracle_contact_points() %}{{ extract('org_locations_publish.company_dim') }}{% endmacro %}
{% macro c12_oracle_cust_profiles() %}{{ extract('BEACONROOFING.companion_data') }}{% endmacro %}
{% macro c13_oracle_party_sites() %}{{ extract('bonus_estimator_ingest.compensation') }}{% endmacro %}
{% macro c14_oracle_cust_acct_sites() %}{{ extract('gold_master_ds.cross_mapper_dim') }}{% endmacro %}
{% macro c15_oracle_cust_acct_roles() %}{{ extract('silver_master_ds.cross_mapper_dim') }}{% endmacro %}
{% macro c16_cust_perf_benchmark() %}{{ extract('sales_order_publish.currency_exchange_trn') }}{% endmacro %}
{% macro c17_bronze_customer() %}{{ extract('org_locations_stage.cust_addon_file_compact') }}{% endmacro %}
{% macro c18_bronze_cust_contact() %}{{ extract('custmr_customer_master_stage.cust_addon_file_snapshot') }}{% endmacro %}
{% macro c19_bronze_cust_email() %}{{ extract('custmr_customer_master_publish.customer_account_dim') }}{% endmacro %}
{% macro s01_sales_header() %}{{ extract('custmr_customer_master_publish.customer_contact_dim') }}{% endmacro %}
{% macro s02_sales_line() %}{{ extract('custmr_customer_master_publish.customer_email_address_master') }}{% endmacro %}
{% macro s03_kodiak() %}{{ extract('custmr_job_master_publish.custmr_job_address_consume') }}{% endmacro %}
{% macro s04_sales_rep() %}{{ extract('custmr_job_master_publish.custmr_job_consume') }}{% endmacro %}
{% macro h01_employee() %}{{ extract('custmr_job_master_publish.custmr_job_note_consume') }}{% endmacro %}
{% macro h02_compensation() %}{{ extract('custmr_customer_master_publish.custmr_price_segment_dim') }}{% endmacro %}
{% macro h03_bonus_emp() %}{{ extract('custmr_customer_master_publish.custmr_terms_header_dim') }}{% endmacro %}
{% macro a01_gl_account() %}{{ extract('dbt_sraja_publish.cus_identification') }}{% endmacro %}
{% macro a02_ar_aging() %}{{ extract('acctng_account_receivable_stage.customer_balance') }}{% endmacro %}
{% macro a03_cust_balance() %}{{ extract('acctng_account_receivable_stage.customer_balance_current') }}{% endmacro %}
{% macro a04_ent_core() %}{{ extract('acctng_account_receivable_publish.customer_balance_trn') }}{% endmacro %}
{% macro i01_inventory() %}{{ extract('acctng_account_receivable_stage.customer_balance_history') }}{% endmacro %}
{% macro i02_forecast() %}{{ extract('customer_master_temp.customer_balance_history_20260421') }}{% endmacro %}
{% macro p01_item_master() %}{{ extract('dbt_njalagam_stage.customer_balance_snapshot') }}{% endmacro %}
{% macro p02_beacon() %}{{ extract('transp_last_mile_delivery_stage.custom_district_compact') }}{% endmacro %}
{% macro p03_fleet() %}{{ extract('transp_last_mile_delivery_stage.custom_district_snapshot') }}{% endmacro %}
{% macro p04_item_hierarchy() %}{{ extract('locorg_location_hierarchy_publish.division_dim') }}{% endmacro %}
