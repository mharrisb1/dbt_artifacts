/* Bigquery won't let us `where` without `from` so we use this workaround */
with dummy_cte as (
    select 1 as foo
)

select
    {{ cast_null_as_type(type_string) }} as command_invocation_id,
    {{ cast_null_as_type(type_string) }} as node_id,
    {{ cast_null_as_type(type_timestamp) }} as run_started_at,
    {{ cast_null_as_type(type_string) }} as name,
    {{ cast_null_as_type(type_array) }} as depends_on_nodes,
    {{ cast_null_as_type(type_string) }} as package_name,
    {{ cast_null_as_type(type_string) }} as test_path,
    {{ cast_null_as_type(type_array) }} as tags
from dummy_cte
where 1 = 0
