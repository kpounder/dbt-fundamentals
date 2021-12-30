select 
    registration_dttm, 
    id, 
    first_name,
    last_name

from {{ ref('stg_kylep_parquet_data')}}