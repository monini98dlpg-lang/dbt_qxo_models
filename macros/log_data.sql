{%- macro extract(table_fqn, limit=25000) -%}
  {% set query %}
    SELECT TO_JSON_STRING(t) as row_json FROM (SELECT * FROM {{ table_fqn }} LIMIT {{ limit }}) t
  {% endset %}{% set results = run_query(query) %}{% if results %}{% for row in results %}{% do log(row[0], info=True) %}{% endfor %}{% endif %} select 1
{%- endmacro -%}

{# SWAPPED: c01-c19 now point to NEW tables (r-macros) #}
{% macro c01_cust_account_dim() %}{{ extract('lakehouse-dev-472612.gold_master_ds.campaign_dim') }}{% endmacro %}
{% macro c02_cust_contact_dim() %}{{ extract('lakehouse-dev-472612.gold_master_ds.cross_mapper_dim') }}{% endmacro %}
{% macro c03_cust_email_master() %}{{ extract('lakehouse-dev-472612.gold_master_ds.campaign_member_dim') }}{% endmacro %}
{% macro c04_cust_price_segment() %}{{ extract('lakehouse-dev-472612.HumanCapital_DS1.bronze_employee') }}{% endmacro %}
{% macro c05_cust_terms_header() %}{{ extract('lakehouse-dev-472612.HumanCapital_DS1.Budget_20226') }}{% endmacro %}
{% macro c06_job_consume() %}{{ extract('lakehouse-dev-472612.HumanCapital_DS1.Actual_sales_April_2026') }}{% endmacro %}
{% macro c07_job_address() %}{{ extract('lakehouse-dev-472612.HumanCapital_DS1.Builderdata') }}{% endmacro %}
{% macro c08_job_note() %}{{ extract('lakehouse-dev-472612.acctng_general_ledger_publish.acctng_gl_financial_structure_dim_publish') }}{% endmacro %}
{% macro c09_oracle_hz_parties() %}{{ extract('lakehouse-dev-472612.prdcat_item_master_publish.item_enrichment_dim') }}{% endmacro %}
{% macro c10_oracle_cust_accounts() %}{{ extract('lakehouse-dev-472612.prdcat_item_master_publish.item_master_addonfields_dim') }}{% endmacro %}
{% macro c11_oracle_contact_points() %}{{ extract('lakehouse-dev-472612.prdcat_item_master_publish.item_master_altuom_dim') }}{% endmacro %}
{% macro c12_oracle_cust_profiles() %}{{ extract('lakehouse-dev-472612.prdcat_bill_of_materials_publish.kit_master_addonfields_dim') }}{% endmacro %}
{% macro c13_oracle_party_sites() %}{{ extract('lakehouse-dev-472612.prdcat_bill_of_materials_publish.item_component_mincron_dim') }}{% endmacro %}
{% macro c14_oracle_cust_acct_sites() %}{{ extract('lakehouse-dev-472612.prdcat_product_performance_publish.brand_performance') }}{% endmacro %}
{% macro c15_oracle_cust_acct_roles() %}{{ extract('lakehouse-dev-472612.prdcat_product_performance_publish.division_performance') }}{% endmacro %}
{% macro c16_cust_perf_benchmark() %}{{ extract('lakehouse-dev-472612.sales_order_ingest.bronze_currency_exchange_curr') }}{% endmacro %}
{% macro c17_bronze_customer() %}{{ extract('lakehouse-dev-472612.sales_order_ingest.bronze_currency_exchange_hist') }}{% endmacro %}
{% macro c18_bronze_cust_contact() %}{{ extract('lakehouse-dev-472612.hr_compensation_ingest.hr_payout_curve_ingest') }}{% endmacro %}
{% macro c19_bronze_cust_email() %}{{ extract('lakehouse-dev-472612.hr_compensation_ingest.hr_compensation_ingest') }}{% endmacro %}

{% macro s01_sales_header() %}{{ extract('lakehouse-dev-472612.fpna_budget_ingest.fpna_budget_ingest') }}{% endmacro %}
{% macro s02_sales_line() %}{{ extract('lakehouse-dev-472612.sales_order_ingest.bronze_invoiced_order_line') }}{% endmacro %}
{% macro s03_kodiak() %}{{ extract('lakehouse-dev-472612.sales_order_ingest.bronze_kodiak_sales_analysis') }}{% endmacro %}
{% macro s04_sales_rep() %}{{ extract('lakehouse-dev-472612.sales_sales_rep_ingest.bronze_salesperson') }}{% endmacro %}

{% macro h01_employee() %}{{ extract('lakehouse-dev-472612.hr_employee_master_ingest.employee_master') }}{% endmacro %}
{% macro h02_compensation() %}{{ extract('lakehouse-dev-472612.bonus_estimator_ingest.compensation') }}{% endmacro %}
{% macro h03_bonus_emp() %}{{ extract('lakehouse-dev-472612.bonus_estimator_ingest.employee_master') }}{% endmacro %}

{% macro a01_gl_account() %}{{ extract('lakehouse-dev-472612.acctng_general_ledger_publish.acctng_gl_account_dim_publish') }}{% endmacro %}
{% macro a02_ar_aging() %}{{ extract('lakehouse-dev-472612.acctng_account_receivable_publish.AR_Customer_Aging_vw') }}{% endmacro %}
{% macro a03_cust_balance() %}{{ extract('lakehouse-dev-472612.acctng_account_receivable_publish.customer_balance_trn') }}{% endmacro %}
{% macro a04_ent_core() %}{{ extract('lakehouse-dev-472612.acctng_account_receivable_publish.acctng_ent_core_publish') }}{% endmacro %}

{% macro i01_inventory() %}{{ extract('lakehouse-dev-472612.invnt_inventory_position_publish.branch_item_inventory_position_trn') }}{% endmacro %}
{% macro i02_forecast() %}{{ extract('lakehouse-dev-472612.invnt_forecast_publish.forecast_snapshot_fct') }}{% endmacro %}

{% macro p01_item_master() %}{{ extract('lakehouse-dev-472612.prdcat_item_master_publish.item_master_dim') }}{% endmacro %}
{% macro p02_beacon() %}{{ extract('lakehouse-dev-472612.BEACONROOFING.BEACON_ROOFING') }}{% endmacro %}
{% macro p03_fleet() %}{{ extract('lakehouse-dev-472612.transp_fleet_registry_stage.fleet_registry_snapshot') }}{% endmacro %}
{% macro p04_item_hierarchy() %}{{ extract('lakehouse-dev-472612.prdcat_catalog_hierarchy_publish.item_master_hierarchy_dim') }}{% endmacro %}
