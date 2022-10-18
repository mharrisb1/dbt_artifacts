/* Bigquery won't let us `where` without `from` so we use this workaround */
with dummy_cte as (
    select 1 as foo
)

select
    {{ cast_null_as_type(type_string()) }} as command_invocation_id,
    {{ cast_null_as_type(type_string()) }} as node_id,
    {{ cast_null_as_type(type_timestamp()) }} as run_started_at,
    {{ cast_null_as_type(type_string()) }} as database,
    {{ cast_null_as_type(type_string()) }} as schema,
    {{ cast_null_as_type(type_string()) }} as source_name,
    {{ cast_null_as_type(type_string()) }} as loader,
    {{ cast_null_as_type(type_string()) }} as name,
    {{ cast_null_as_type(type_string()) }} as identifier,
    {{ cast_null_as_type(type_string()) }} as loaded_at_field,
    {% if target.type == 'snowflake'%}
        {{ cast_null_as_type(type_array()) }} as freshness
    {% else %}
        {{ cast_null_as_type(type_json()) }} as freshness
    {% endif %}
from dummy_cte
where 1 = 0
