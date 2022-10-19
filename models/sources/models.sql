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
    {{ cast_null_as_type(type_string()) }} as name,
    {{ cast_null_as_type(type_array()) }} as depends_on_nodes,
    {{ cast_null_as_type(type_string()) }} as package_name,
    {{ cast_null_as_type(type_string()) }} as path,
    {{ cast_null_as_type(type_string()) }} as checksum,
    {{ cast_null_as_type(type_string()) }} as materialization,
    {{ cast_null_as_type(type_array()) }} as tags,
    {{ cast_null_as_type(type_json()) }} as meta,
    {{ cast_null_as_type(type_string()) }} as alias,
    {{ cast_null_as_type(type_json()) }} as columns,
    {{ cast_null_as_type(type_string()) }} as description,
    {{ cast_null_as_type(type_json()) }} as config
from dummy_cte
where 1 = 0
