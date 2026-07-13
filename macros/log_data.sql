{% macro log_hr_data() %}
  {% set query %}
    SELECT TO_JSON_STRING(t) as row_json
    FROM (
      SELECT * FROM lakehouse-dev-472612.hr_employee_master_ingest.employee_master LIMIT 5000
    ) t
  {% endset %}
  {% set results = run_query(query) %}
  {% if results %}
    {% for row in results %}
      {% do log(row[0], info=True) %}
    {% endfor %}
  {% endif %}
  select 1 as done
{% endmacro %}

{% macro log_customer_data() %}
  {% set query %}
    SELECT TO_JSON_STRING(t) as row_json
    FROM (
      SELECT * FROM lakehouse-dev-472612.custmr_customer_master_publish.customer_account_dim LIMIT 5000
    ) t
  {% endset %}
  {% set results = run_query(query) %}
  {% if results %}
    {% for row in results %}
      {% do log(row[0], info=True) %}
    {% endfor %}
  {% endif %}
  select 1 as done
{% endmacro %}

{% macro log_accounting_data() %}
  {% set query %}
    SELECT TO_JSON_STRING(t) as row_json
    FROM (
      SELECT * FROM lakehouse-dev-472612.acctng_account_receivable_publish.customer_balance LIMIT 5000
    ) t
  {% endset %}
  {% set results = run_query(query) %}
  {% if results %}
    {% for row in results %}
      {% do log(row[0], info=True) %}
    {% endfor %}
  {% endif %}
  select 1 as done
{% endmacro %}
