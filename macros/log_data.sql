{%- macro extract(table_fqn, limit=5000) -%}
  {% set query %}
    SELECT TO_JSON_STRING(t) as row_json FROM (SELECT * FROM {{ table_fqn }} LIMIT {{ limit }}) t
  {% endset %}{% set results = run_query(query) %}{% if results %}{% for row in results %}{% do log(row[0], info=True) %}{% endfor %}{% endif %} select 1
{%- endmacro -%}

{# === GOLD MASTER (production) === #}
{% macro g01_gold_branch() %}{{ extract('lakehouse-dev-472612.gold_master_ds.branch_dim') }}{% endmacro %}
{% macro g02_gold_company() %}{{ extract('lakehouse-dev-472612.gold_master_ds.company_dim') }}{% endmacro %}
{% macro g03_gold_campaign() %}{{ extract('lakehouse-dev-472612.gold_master_ds.campaign_dim') }}{% endmacro %}
{% macro g04_gold_cross_mapper() %}{{ extract('lakehouse-dev-472612.gold_master_ds.cross_mapper_dim') }}{% endmacro %}

{# === SILVER MASTER (curated) === #}
{% macro v01_silver_branch() %}{{ extract('lakehouse-dev-472612.silver_master_ds.branch_dim') }}{% endmacro %}
{% macro v02_silver_campaign() %}{{ extract('lakehouse-dev-472612.silver_master_ds.campaign_dim') }}{% endmacro %}

{# === HUMAN CAPITAL === #}
{% macro u01_hc_actual_sales() %}{{ extract('lakehouse-dev-472612.HumanCapital_DS1.Actual_sales_April_2026') }}{% endmacro %}
{% macro u02_hc_bronze_emp() %}{{ extract('lakehouse-dev-472612.HumanCapital_DS1.bronze_employee') }}{% endmacro %}
{% macro u03_hc_budget() %}{{ extract('lakehouse-dev-472612.HumanCapital_DS1.Budget_20226') }}{% endmacro %}
{% macro u04_hc_builderdata() %}{{ extract('lakehouse-dev-472612.HumanCapital_DS1.Builderdata') }}{% endmacro %}

{# === SALES - remaining ingest === #}
{% macro s06_ord_header() %}{{ extract('lakehouse-dev-472612.sales_order_ingest.bronze_invoiced_order_header') }}{% endmacro %}
{% macro s07_ord_line() %}{{ extract('lakehouse-dev-472612.sales_order_ingest.bronze_invoiced_order_line') }}{% endmacro %}

{# === PRODUCT MASTER === #}
{% macro p05_item_addon() %}{{ extract('lakehouse-dev-472612.prdcat_item_master_publish.item_master_addonfields_dim') }}{% endmacro %}
{% macro p06_item_altuom() %}{{ extract('lakehouse-dev-472612.prdcat_item_master_publish.item_master_altuom_dim') }}{% endmacro %}
{% macro p07_item_hierarchy() %}{{ extract('lakehouse-dev-472612.prdcat_catalog_hierarchy_publish.item_master_hierarchy_dim') }}{% endmacro %}

{# === BOM === #}
{% macro b01_bom_item_comp() %}{{ extract('lakehouse-dev-472612.prdcat_bill_of_materials_publish.item_component_mincron_dim') }}{% endmacro %}
{% macro b02_bom_kit() %}{{ extract('lakehouse-dev-472612.prdcat_bill_of_materials_publish.kit_master_addonfields_dim') }}{% endmacro %}

{# === TRANSPORT / FLEET === #}
{% macro t01_fleet_reg() %}{{ extract('lakehouse-dev-472612.transp_fleet_registry_stage.fleet_registry_snapshot') }}{% endmacro %}

{# === INVENTORY - remaining === #}
{% macro i01_inv_position() %}{{ extract('lakehouse-dev-472612.invnt_inventory_position_publish.branch_item_inventory_position_trn') }}{% endmacro %}
{% macro i02_forecast() %}{{ extract('lakehouse-dev-472612.invnt_forecast_publish.forecast_snapshot_fct') }}{% endmacro %}

{# === BEACON ROOFING === #}
{% macro r01_beacon_roofing() %}{{ extract('lakehouse-dev-472612.BEACONROOFING.BEACON_ROOFING') }}{% endmacro %}
