{% macro convert_currency(column_name, rate=83.0) %}
    ({{ column_name }} * {{ rate }})
{% endmacro %}