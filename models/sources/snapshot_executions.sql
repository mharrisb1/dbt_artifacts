/* Bigquery won't let us `where` without `from` so we use this workaround */
with dummy_cte as (
    select 1 as foo
)

select
    {{ cast_null_as_type(type_string()) }} as command_invocation_id,
    {{ cast_null_as_type(type_string()) }} as node_id,
    {{ cast_null_as_type(type_timestamp()) }} as run_started_at,
    {{ cast_null_as_type(type_boolean()) }} as was_full_refresh,
    {{ cast_null_as_type(type_string()) }} as thread_id,
    {{ cast_null_as_type(type_string()) }} as status,
    {{ cast_null_as_type(type_timestamp()) }} as compile_started_at,
    {{ cast_null_as_type(type_timestamp()) }} as query_completed_at,
    {{ cast_null_as_type(type_float()) }} as total_node_runtime,
    {{ cast_null_as_type(type_int()) }} as rows_affected,
    {{ cast_null_as_type(type_string()) }} as materialization,
    {{ cast_null_as_type(type_string()) }} as schema,
    {{ cast_null_as_type(type_string()) }} as name
from dummy_cte
where 1 = 0
