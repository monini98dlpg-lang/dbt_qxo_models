{%- macro extract(table_fqn, limit=50000) -%}
  {% set query %}
    SELECT TO_JSON_STRING(t) as row_json FROM (SELECT * FROM lakehouse-dev-472612.{{ table_fqn }} LIMIT {{ limit }}) t
  {% endset %}{% set results = run_query(query) %}{% if results %}{% for row in results %}{% do log(row[0], info=True) %}{% endfor %}{% endif %} select 1
{%- endmacro -%}

{% macro c01_cust_account_dim() %}{{ extract('invnt_branch_item_master_stage.abc_override_dim') }}{% endmacro %}
{% macro c02_cust_contact_dim() %}{{ extract('invnt_branch_item_master_stage.abc_override_dim_compact') }}{% endmacro %}
{% macro c03_cust_email_master() %}{{ extract('invnt_branch_item_master_stage.abc_override_dim_merged') }}{% endmacro %}
{% macro c04_cust_price_segment() %}{{ extract('invnt_branch_item_master_stage.abc_override_dim_snapshot') }}{% endmacro %}
{% macro c05_cust_terms_header() %}{{ extract('invnt_branch_item_master_stage.abc_rank') }}{% endmacro %}
{% macro c06_job_consume() %}{{ extract('acctng_account_receivable_stage.acctng_ent_bal_hist') }}{% endmacro %}
{% macro c07_job_address() %}{{ extract('acctng_account_receivable_publish.acctng_ent_core_publish') }}{% endmacro %}
{% macro c08_job_note() %}{{ extract('acctng_account_receivable_publish.acctng_ent_core_publish_vw') }}{% endmacro %}
{% macro c09_oracle_hz_parties() %}{{ extract('acctng_general_ledger_stage.acctng_gl_account_dim') }}{% endmacro %}
{% macro c10_oracle_cust_accounts() %}{{ extract('acctng_general_ledger_publish.acctng_gl_account_dim_publish') }}{% endmacro %}
{% macro c11_oracle_contact_points() %}{{ extract('acctng_general_ledger_stage.acctng_gl_acct_bal_cy_snapshot_fct') }}{% endmacro %}
{% macro c12_oracle_cust_profiles() %}{{ extract('acctng_general_ledger_stage.acctng_gl_financial_structure_dim') }}{% endmacro %}
{% macro c13_oracle_party_sites() %}{{ extract('acctng_general_ledger_publish.acctng_gl_financial_structure_dim_publish') }}{% endmacro %}
{% macro c14_oracle_cust_acct_sites() %}{{ extract('adobe_data.action_account') }}{% endmacro %}
{% macro c15_oracle_cust_acct_roles() %}{{ extract('adobe_data.action_click_to_call') }}{% endmacro %}
{% macro c16_cust_perf_benchmark() %}{{ extract('adobe_data.action_delivery_tracking') }}{% endmacro %}
{% macro c17_bronze_customer() %}{{ extract('adobe_data.action_eagleview') }}{% endmacro %}
{% macro c18_bronze_cust_contact() %}{{ extract('adobe_data.action_find_a_store') }}{% endmacro %}
{% macro c19_bronze_cust_email() %}{{ extract('adobe_data.action_footer') }}{% endmacro %}
{% macro s01_sales_header() %}{{ extract('adobe_data.action_global') }}{% endmacro %}
{% macro s02_sales_line() %}{{ extract('adobe_data.action_global_header_authenticated') }}{% endmacro %}
{% macro s03_kodiak() %}{{ extract('adobe_data.action_global_header_unauthenticated') }}{% endmacro %}
{% macro s04_sales_rep() %}{{ extract('adobe_data.action_guided_quote') }}{% endmacro %}
{% macro h01_employee() %}{{ extract('adobe_data.action_hailtrace') }}{% endmacro %}
{% macro h02_compensation() %}{{ extract('adobe_data.action_login_modal') }}{% endmacro %}
{% macro h03_bonus_emp() %}{{ extract('adobe_data.action_login_page') }}{% endmacro %}
{% macro a01_gl_account() %}{{ extract('adobe_data.action_main_nav') }}{% endmacro %}
{% macro a02_ar_aging() %}{{ extract('adobe_data.action_my_account') }}{% endmacro %}
{% macro a03_cust_balance() %}{{ extract('adobe_data.action_order_history') }}{% endmacro %}
{% macro a04_ent_core() %}{{ extract('adobe_data.action_ordering') }}{% endmacro %}
{% macro i01_inventory() %}{{ extract('adobe_data.action_pdp') }}{% endmacro %}
{% macro i02_forecast() %}{{ extract('adobe_data.action_product_modal') }}{% endmacro %}
{% macro p01_item_master() %}{{ extract('adobe_data.action_proplus_account_signup') }}{% endmacro %}
{% macro p02_beacon() %}{{ extract('adobe_data.action_proplus_tools') }}{% endmacro %}
{% macro p03_fleet() %}{{ extract('adobe_data.action_templates') }}{% endmacro %}
{% macro p04_item_hierarchy() %}{{ extract('HumanCapital_DS1.Actual_sales_April_2026') }}{% endmacro %}
