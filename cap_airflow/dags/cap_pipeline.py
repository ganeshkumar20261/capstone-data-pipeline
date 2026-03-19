from airflow import DAG
from airflow.operators.bash import BashOperator
from datetime import datetime

default_args = {
    'owner': 'ganesh',
    'retries': 1,
}

with DAG(
    dag_id='cap_pipeline',
    default_args=default_args,
    description='Capstone pipeline: load_raw >> dbt_run >> dbt_test',
    schedule_interval='@daily',
    start_date=datetime(2026, 1, 1),
    catchup=False,
    tags=['capstone'],
) as dag:

    load_raw = BashOperator(
        task_id='load_raw',
        bash_command='echo "Loading RAW data from S3 stage into Snowflake..."',
    )

    dbt_run = BashOperator(
        task_id='dbt_run',
        bash_command='cd /opt/airflow/dags/cap_dbt && dbt run',
    )

    dbt_test = BashOperator(
        task_id='dbt_test',
        bash_command='cd /opt/airflow/dags/cap_dbt && dbt test',
    )

    load_raw >> dbt_run >> dbt_test