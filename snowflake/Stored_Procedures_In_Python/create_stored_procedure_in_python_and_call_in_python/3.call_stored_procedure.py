from snowflake.snowpark import Session

connection_params = {
    "account": "<your_account>",
    "user": "<your_username>",
    "password": "<your_password>",
    "role": "<your_role>",
    "warehouse": "<your_warehouse>",
    "database": "<your_database>",
    "schema": "<your_schema>"
}

session = Session.builder.configs(connection_params).create()

# Call the stored procedure
result = session.sql("CALL get_employee_count();").collect()
print("Employee Count:", result[0][0])

session.close()
