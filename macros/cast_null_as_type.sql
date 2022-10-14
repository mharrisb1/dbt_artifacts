{% macro cast_null_as_type(type) -%}
    {{ return(adapter.dispatch('cast_null_as_type')(type)) }}
{%- endmacro %}

{% macro default__cast_null_as_type(type) -%}
    cast(null as {{ type }})
{%- endmacro %}

{% macro clickhouse__cast_null_as_type(type) -%}
    cast(null, 'Nullable({{ type }})')
{%- endmacro %}
