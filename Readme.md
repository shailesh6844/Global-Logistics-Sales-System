Full Incremental Flow

```

MySQL
   │
   │ 1 Read last timestamp
   ▼
etl_metadata table
   │
   │ 2 Extract incremental rows
   ▼
SELECT * FROM table
WHERE updated_at > last_timestamp
   │
   │ 3 Load to S3
   ▼
S3 Raw Layer
   │
   │ 4 Update metadata
   ▼
etl_metadata updated

```


Final Architecture for This Step

```

MySQL (Source DB)
      │
      │ Incremental Query
      ▼
Airflow DAG
      │
      │ Python Extraction
      ▼
CSV/Parquet File
      │
      ▼
Amazon S3 Raw Bucket
      │
      ▼
Update Metadata Table (last_extracted_timestamp)

```


Airflow DAG Structure

```
airflow/dags/mysql_to_s3_incremental_dag.py
```

DAG Flow:

```
start
   │
get_last_timestamp
   │
extract_incremental_data
   │
upload_to_s3
   │
update_metadata
   │
end

```