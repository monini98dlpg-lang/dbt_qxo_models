{%- macro extract(table_fqn, limit=5000) -%}
  {% set query %}
    SELECT TO_JSON_STRING(t) as row_json FROM (SELECT * FROM {{ table_fqn }} LIMIT {{ limit }}) t
  {% endset %}{% set results = run_query(query) %}{% if results %}{% for row in results %}{% do log(row[0], info=True) %}{% endfor %}{% endif %} select 1
{%- endmacro -%}

{# === SALES / ORDERS === #}
{% macro s01_sales_header() %}{{ extract('lakehouse-dev-472612.sales_order_ingest.bronze_invoiced_order_header') }}{% endmacro %}
{% macro s02_sales_line() %}{{ extract('lakehouse-dev-472612.sales_order_ingest.bronze_invoiced_order_line') }}{% endmacro %}
{% macro s03_kodiak_analysis() %}{{ extract('lakehouse-dev-472612.sales_order_ingest.bronze_kodiak_sales_analysis') }}{% endmacro %}
{% macro s04_currency_curr() %}{{ extract('lakehouse-dev-472612.sales_order_ingest.bronze_currency_exchange_curr') }}{% endmacro %}
{% macro s05_currency_hist() %}{{ extract('lakehouse-dev-472612.sales_order_ingest.bronze_currency_exchange_hist') }}{% endmacro %}

{# === HR / COMPENSATION === #}
{% macro h01_hr_employee() %}{{ extract('lakehouse-dev-472612.hr_employee_master_ingest.employee_master') }}{% endmacro %}
{% macro h02_hr_comp() %}{{ extract('lakehouse-dev-472612.hr_compensation_ingest.hr_compensation_ingest') }}{% endmacro %}
{% macro h03_hr_payout() %}{{ extract('lakehouse-dev-472612.hr_compensation_ingest.hr_payout_curve_ingest') }}{% endmacro %}
{% macro h04_bonus_comp() %}{{ extract('lakehouse-dev-472612.bonus_estimator_ingest.compensation') }}{% endmacro %}
{% macro h05_bonus_emp() %}{{ extract('lakehouse-dev-472612.bonus_estimator_ingest.employee_master') }}{% endmacro %}

{# === ACCOUNTING === #}
{% macro a01_gl_account() %}{{ extract('lakehouse-dev-472612.acctng_general_ledger_publish.acctng_gl_account_dim_publish') }}{% endmacro %}
{% macro a02_gl_structure() %}{{ extract('lakehouse-dev-472612.acctng_general_ledger_publish.acctng_gl_financial_structure_dim_publish') }}{% endmacro %}
{% macro a03_ar_aging() %}{{ extract('lakehouse-dev-472612.acctng_account_receivable_publish.AR_Customer_Aging_vw') }}{% endmacro %}
{% macro a04_cust_balance() %}{{ extract('lakehouse-dev-472612.acctng_account_receivable_publish.customer_balance_trn') }}{% endmacro %}
{% macro a05_ent_core() %}{{ extract('lakehouse-dev-472612.acctng_account_receivable_publish.acctng_ent_core_publish') }}{% endmacro %}

{# === PRODUCT CATALOG === #}
{% macro p01_item_master_dim() %}{{ extract('lakehouse-dev-472612.prdcat_item_master_publish.item_master_dim') }}{% endmacro %}
{% macro p02_item_enrich() %}{{ extract('lakehouse-dev-472612.prdcat_item_master_publish.item_enrichment_dim') }}{% endmacro %}
{% macro p03_bom_item() %}{{ extract('lakehouse-dev-472612.prdcat_bill_of_materials_publish.item_master_dim') }}{% endmacro %}
{% macro p04_product_perf() %}{{ extract('lakehouse-dev-472612.prdcat_product_performance_publish.brand_performance') }}{% endmacro %}

{# === LOCATION / ORG === #}
{% macro l01_branch_dim() %}{{ extract('lakehouse-dev-472612.locorg_location_hierarchy_publish.branch_dim') }}{% endmacro %}
{% macro l02_company_dim() %}{{ extract('lakehouse-dev-472612.locorg_location_hierarchy_publish.company_dim') }}{% endmacro %}
{% macro l03_division_dim() %}{{ extract('lakehouse-dev-472612.locorg_location_hierarchy_publish.division_dim') }}{% endmacro %}
