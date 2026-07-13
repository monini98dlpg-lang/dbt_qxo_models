{% macro log_query_results() %}
  {% set query %}
    SELECT TO_JSON_STRING(t) as row_json
    FROM (
      SELECT * FROM lakehouse-dev-472612.hr_employee_master_ingest.employee_master LIMIT 100
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
