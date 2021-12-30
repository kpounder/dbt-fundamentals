{{ config(materialized='view', bind=False) }}

with kylep_parquet_data as (

    select * from {{ source('parquet_test', 'kylep_parquet_data')}}

)

select * from kylep_parquet_data