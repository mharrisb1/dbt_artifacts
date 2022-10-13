/* Bigquery won't let us `where` without `from` so we use this workaround */
with dummy_cte as (
    select 1 as foo
)

select
    {{ cast_null_as_type(type_string) }} as command_invocation_id,
    {{ cast_null_as_type(type_string) }} as dbt_version,
    {{ cast_null_as_type(type_string) }} as project_name,
    {{ cast_null_as_type(type_timestamp) }} as run_started_at,
    {{ cast_null_as_type(type_timestamp) }} as dbt_command,
    {{ cast_null_as_type(type_boolean) }} as full_refresh_flag,
    {{ cast_null_as_type(type_string) }} as target_profile_name,
    {{ cast_null_as_type(type_string) }} as target_name,
    {{ cast_null_as_type(type_string) }} as target_schema,
    {{ cast_null_as_type(type_int) }} as target_threads,
    {{ cast_null_as_type(type_string) }} as dbt_cloud_project_id,
    {{ cast_null_as_type(type_string) }} as dbt_cloud_job_id,
    {{ cast_null_as_type(type_string) }} as dbt_cloud_run_id,
    {{ cast_null_as_type(type_string) }} as dbt_cloud_run_reason_category,
    {{ cast_null_as_type(type_string) }} as dbt_cloud_run_reason,
    {{ cast_null_as_type(type_json) }} as env_vars,
    {{ cast_null_as_type(type_json) }} as dbt_vars
from dummy_cte
where 1 = 0
