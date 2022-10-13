{#
    Since folks commonly install dbt_artifacts alongside a myriad of other packages,
    we copy the dbt_utils implementation of the surrogate_key macro so we don't have
    any dependencies to make conflicts worse!
#}

{%- macro surrogate_key(field_list) -%}
    {# needed for safe_add to allow for non-keyword arguments see SO post #}
    {# https://stackoverflow.com/questions/13944751/args-kwargs-in-jinja2-macros #}
    {% set frustrating_jinja_feature = varargs %}
    {{ return(adapter.dispatch('surrogate_key', 'dbt_artifacts')(field_list, *varargs)) }}
{% endmacro %}

{%- macro default__surrogate_key(field_list) -%}

{%- if varargs|length >= 1 or field_list is string %}

{%- set error_message = '
Warning: the `surrogate_key` macro now takes a single list argument instead of \
multiple string arguments. The {}.{} model triggered this warning. \
'.format(model.package_name, model.name) -%}

{%- do exceptions.warn(error_message) -%}

{# first argument is not included in varargs, so add first element to field_list_xf #}
{%- set field_list_xf = [field_list] -%}

{%- for field in varargs %}
{%- set _ = field_list_xf.append(field) -%}
{%- endfor -%}

{%- else -%}

{# if using list, just set field_list_xf as field_list #}
{%- set field_list_xf = field_list -%}

{%- endif -%}


{%- set fields = [] -%}

{%- for field in field_list_xf -%}

    {%- set _ = fields.append(
        "coalesce(cast(" ~ field ~ " as " ~ type_string() ~ "), '')"
    ) -%}

    {%- if not loop.last %}
        {%- set _ = fields.append("'-'") -%}
    {%- endif -%}

{%- endfor -%}

{{ hash(concat(fields)) }}

{%- endmacro -%}


{%- macro clickhouse__surrogate_key(field_list) -%}

{%- if varargs|length >= 1 or field_list is string %}

{%- set error_message = '
Warning: the `surrogate_key` macro now takes a single list argument instead of \
multiple string arguments. The {}.{} model triggered this warning. \
'.format(model.package_name, model.name) -%}

{%- do exceptions.warn(error_message) -%}

{# first argument is not included in varargs, so add first element to field_list_xf #}
{%- set field_list_xf = [field_list] -%}

{%- for field in varargs %}
{%- set _ = field_list_xf.append(field) -%}
{%- endfor -%}

{%- else -%}

{# if using list, just set field_list_xf as field_list #}
{%- set field_list_xf = field_list -%}

{%- endif -%}


{%- set fields = [] -%}

{%- for field in field_list_xf -%}

    {%- set _ = fields.append(
        "coalesce(cast(" ~ field ~ " as " ~ type_string() ~ "), '')"
    ) -%}

    {%- if not loop.last %}
        {%- set _ = fields.append("'-'") -%}
    {%- endif -%}

{%- endfor -%}

{#- Clickhouse is case-sensitive so we have to use `MD5` instead of `md5` -#}

MD5({{ concat(fields) }})

{%- endmacro -%}
