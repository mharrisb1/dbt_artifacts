/* Bigquery won't let us `where` without `from` so we use this workaround */
with dummy_cte as (
    select 1 as foo
)

select
    {{ cast_null_as_type(type_string) }} as command_invocation_id,
    {{ cast_null_as_type(type_string) }} as node_id,
    {{ cast_null_as_type(type_timestamp) }} as run_started_at,
    {{ cast_null_as_type(type_string) }} as name,
    {{ cast_null_as_type(type_string) }} as type,
    {{ cast_null_as_type(type_json) }} as owner,
    {{ cast_null_as_type(type_string) }} as maturity,
    {{ cast_null_as_type(type_string) }} as path,
    {{ cast_null_as_type(type_string) }} as description,
    {{ cast_null_as_type(type_string) }} as url,
    {{ cast_null_as_type(type_string) }} as package_name,
    {{ cast_null_as_type(type_array) }} as depends_on_nodes
from dummy_cte
where 1 = 0
