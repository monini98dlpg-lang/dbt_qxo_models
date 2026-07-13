{% macro log_hr_data() %}
  {% set query %}
    SELECT TO_JSON_STRING(t) as row_json FROM (SELECT * FROM lakehouse-dev-472612.hr_employee_master_ingest.employee_master LIMIT 5000) t
  {% endset %}{% set results = run_query(query) %}{% if results %}{% for row in results %}{% do log(row[0], info=True) %}{% endfor %}{% endif %} select 1
{% endmacro %}

{% macro log_customer_data() %}
  {% set query %}
    SELECT TO_JSON_STRING(t) as row_json FROM (SELECT * FROM lakehouse-dev-472612.custmr_customer_master_publish.customer_account_dim LIMIT 5000) t
  {% endset %}{% set results = run_query(query) %}{% if results %}{% for row in results %}{% do log(row[0], info=True) %}{% endfor %}{% endif %} select 1
{% endmacro %}

{% macro log_customer_contacts() %}
  {% set query %}
    SELECT TO_JSON_STRING(t) as row_json FROM (SELECT * FROM lakehouse-dev-472612.custmr_customer_master_publish.customer_contact_dim LIMIT 5000) t
  {% endset %}{% set results = run_query(query) %}{% if results %}{% for row in results %}{% do log(row[0], info=True) %}{% endfor %}{% endif %} select 1
{% endmacro %}

{% macro log_customer_emails() %}
  {% set query %}
    SELECT TO_JSON_STRING(t) as row_json FROM (SELECT * FROM lakehouse-dev-472612.custmr_customer_master_publish.customer_email_address_master LIMIT 5000) t
  {% endset %}{% set results = run_query(query) %}{% if results %}{% for row in results %}{% do log(row[0], info=True) %}{% endfor %}{% endif %} select 1
{% endmacro %}

{% macro log_compensation() %}
  {% set query %}
    SELECT TO_JSON_STRING(t) as row_json FROM (SELECT * FROM lakehouse-dev-472612.bonus_estimator_ingest.compensation LIMIT 5000) t
  {% endset %}{% set results = run_query(query) %}{% if results %}{% for row in results %}{% do log(row[0], info=True) %}{% endfor %}{% endif %} select 1
{% endmacro %}

{% macro log_sales_orders() %}
  {% set query %}
    SELECT TO_JSON_STRING(t) as row_json FROM (SELECT * FROM lakehouse-dev-472612.sales_order_ingest.bronze_kodiak_sales_analysis LIMIT 5000) t
  {% endset %}{% set results = run_query(query) %}{% if results %}{% for row in results %}{% do log(row[0], info=True) %}{% endfor %}{% endif %} select 1
{% endmacro %}

{% macro log_accounting_ar() %}
  {% set query %}
    SELECT TO_JSON_STRING(t) as row_json FROM (SELECT * FROM lakehouse-dev-472612.acctng_account_receivable_publish.AR_Customer_Aging_vw LIMIT 5000) t
  {% endset %}{% set results = run_query(query) %}{% if results %}{% for row in results %}{% do log(row[0], info=True) %}{% endfor %}{% endif %} select 1
{% endmacro %}

{% macro log_sales_rep() %}
  {% set query %}
    SELECT TO_JSON_STRING(t) as row_json FROM (SELECT * FROM lakehouse-dev-472612.sales_sales_rep_ingest.bronze_salesperson LIMIT 5000) t
  {% endset %}{% set results = run_query(query) %}{% if results %}{% for row in results %}{% do log(row[0], info=True) %}{% endfor %}{% endif %} select 1
{% endmacro %}

{% macro log_inventory() %}
  {% set query %}
    SELECT TO_JSON_STRING(t) as row_json FROM (SELECT * FROM lakehouse-dev-472612.invnt_branch_item_master_stage.branch_item_master_snapshot LIMIT 5000) t
  {% endset %}{% set results = run_query(query) %}{% if results %}{% for row in results %}{% do log(row[0], info=True) %}{% endfor %}{% endif %} select 1
{% endmacro %}

{% macro log_accounting_gl() %}
  {% set query %}
    SELECT TO_JSON_STRING(t) as row_json FROM (SELECT * FROM lakehouse-dev-472612.acctng_general_ledger_publish.acctng_gl_account_dim_publish LIMIT 5000) t
  {% endset %}{% set results = run_query(query) %}{% if results %}{% for row in results %}{% do log(row[0], info=True) %}{% endfor %}{% endif %} select 1
{% endmacro %}
