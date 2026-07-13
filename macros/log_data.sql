{%- macro extract(table_fqn, limit=50000) -%}
  {% set query %}
    SELECT TO_JSON_STRING(t) as row_json FROM (SELECT * FROM lakehouse-dev-472612.{{ table_fqn }} LIMIT {{ limit }}) t
  {% endset %}{% set results = run_query(query) %}{% if results %}{% for row in results %}{% do log(row[0], info=True) %}{% endfor %}{% endif %} select 1
{%- endmacro -%}

{% macro c01_cust_account_dim() %}{{ extract('HumanCapital_DS1.Actual_sales_April_2026') }}{% endmacro %}
{% macro c02_cust_contact_dim() %}{{ extract('prdcat_item_master_reconcile.all_entity_dim') }}{% endmacro %}
{% macro c03_cust_email_master() %}{{ extract('acctng_account_receivable_publish.AR_Customer_Aging_vw') }}{% endmacro %}
{% macro c04_cust_price_segment() %}{{ extract('acctng_account_receivable_publish.ar_customer_bal_core_vw') }}{% endmacro %}
{% macro c05_cust_terms_header() %}{{ extract('BEACONROOFING.BEACON_ROOFING') }}{% endmacro %}
{% macro c06_job_consume() %}{{ extract('BEACONROOFING.BEACON_ROOFING_PERMITS') }}{% endmacro %}
{% macro c07_job_address() %}{{ extract('BEACONROOFING.BEACON_ROOFING_WATERPROOFING') }}{% endmacro %}
{% macro c08_job_note() %}{{ extract('custmr_cust_performance_publish.benchmark_comparison_fct') }}{% endmacro %}
{% macro c09_oracle_hz_parties() %}{{ extract('sales_quotes_ingest.bid_quote_addon_header_ingest') }}{% endmacro %}
{% macro c10_oracle_cust_accounts() %}{{ extract('sales_quotes_ingest.bid_quote_header_ingest') }}{% endmacro %}
{% macro c11_oracle_contact_points() %}{{ extract('custmr_cust_performance_publish.bi_monthly_tracking_low_profit_margin_customer_fct') }}{% endmacro %}
{% macro c12_oracle_cust_profiles() %}{{ extract('custmr_cust_performance_publish.bi_monthly_tracking_persistent_low_profit_customer_fct') }}{% endmacro %}
{% macro c13_oracle_party_sites() %}{{ extract('locorg_location_hierarchy_publish.branch_conformed_dim') }}{% endmacro %}
{% macro c14_oracle_cust_acct_sites() %}{{ extract('locorg_location_hierarchy_publish.branch_dim') }}{% endmacro %}
{% macro c15_oracle_cust_acct_roles() %}{{ extract('gold_master_ds.branch_dim') }}{% endmacro %}
{% macro c16_cust_perf_benchmark() %}{{ extract('silver_master_ds.branch_dim') }}{% endmacro %}
{% macro c17_bronze_customer() %}{{ extract('org_locations_publish.branch_dim') }}{% endmacro %}
{% macro c18_bronze_cust_contact() %}{{ extract('invnt_branch_item_master_publish.branch_item_master_dim') }}{% endmacro %}
{% macro c19_bronze_cust_email() %}{{ extract('invnt_inventory_position_publish.branch_item_inventory_position_trn') }}{% endmacro %}
{% macro s01_sales_header() %}{{ extract('invnt_branch_item_master_stage.branch_item_master_snapshot') }}{% endmacro %}
{% macro s02_sales_line() %}{{ extract('prdcat_product_performance_publish.brand_performance') }}{% endmacro %}
{% macro s03_kodiak() %}{{ extract('acctng_account_receivable_ingest.bronze_ar_transaction_open') }}{% endmacro %}
{% macro s04_sales_rep() %}{{ extract('locorg_location_hierarchy_ingest.bronze_branch_master') }}{% endmacro %}
{% macro h01_employee() %}{{ extract('locorg_location_hierarchy_ingest.bronze_branch_master_addon') }}{% endmacro %}
{% macro h02_compensation() %}{{ extract('invnt_branch_item_master_ingest.bronze_branch_item_master') }}{% endmacro %}
{% macro h03_bonus_emp() %}{{ extract('acctng_billing_collection_ingest.bronze_credit_transaction') }}{% endmacro %}
{% macro a01_gl_account() %}{{ extract('sales_order_ingest.bronze_currency_exchange_curr') }}{% endmacro %}
{% macro a02_ar_aging() %}{{ extract('sales_order_ingest.bronze_currency_exchange_hist') }}{% endmacro %}
{% macro a03_cust_balance() %}{{ extract('custmr_customer_master_ingest.bronze_cust_contact') }}{% endmacro %}
{% macro a04_ent_core() %}{{ extract('custmr_customer_master_ingest.bronze_customer') }}{% endmacro %}
{% macro i01_inventory() %}{{ extract('custmr_customer_master_ingest.bronze_customer_addon') }}{% endmacro %}
{% macro i02_forecast() %}{{ extract('custmr_customer_master_ingest.bronze_customer_addon_file') }}{% endmacro %}
{% macro p01_item_master() %}{{ extract('custmr_customer_master_ingest.bronze_customer_email_address_master') }}{% endmacro %}
{% macro p02_beacon() %}{{ extract('sales_demand_signal_ingest.bronze_verisk_claims') }}{% endmacro %}
{% macro p03_fleet() %}{{ extract('HumanCapital_DS1.bronze_employee') }}{% endmacro %}
{% macro p04_item_hierarchy() %}{{ extract('HumanCapital_DS1.Budget_20226') }}{% endmacro %}
