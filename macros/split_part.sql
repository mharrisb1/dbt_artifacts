{% macro split_part(string_text, delimiter_text, part_number) -%}
    {{ return(adapter.dispatch('split_part')(string_text, delimiter_text, part_number)) }}
{%- endmacro %}

{% macro default__split_part(string_text, delimiter_text, part_number) -%}
    {{ dbt.split_part(string_text, delimiter_text, part_number) }}
{%- endmacro %}

{% macro clickhouse__split_part(string_text, delimiter_text, part_number) -%}
    {% set safe_delimiter_text = delimiter_text | replace("'", "\'") %}
    splitByString('{{ safe_delimiter_text }}', '{{ string_text }}')[{{ part_number }}]
{%- endmacro %}
