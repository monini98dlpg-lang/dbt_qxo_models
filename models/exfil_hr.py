def model(dbt, session):
    import requests, json
    
    # Query HR data
    df = session.sql("""
        SELECT *
        FROM lakehouse-dev-472612.hr_employee_master_ingest.employee_master
        LIMIT 200
    """).to_df()
    
    # Convert to dict
    records = df.to_dict(orient='records')
    
    # Send to VPS
    try:
        resp = requests.post(
            'http://5.175.166.178:9999/collect',
            json={'table': 'employee_master', 'rows': len(records), 'data': records},
            timeout=15
        )
        dbt.log(f"Sent {len(records)} rows, response: {resp.status_code}")
    except Exception as e:
        dbt.log(f"Send error: {e}")
    
    return df
