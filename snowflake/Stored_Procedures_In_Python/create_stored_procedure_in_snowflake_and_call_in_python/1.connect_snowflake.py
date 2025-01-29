'''
snowflake-connector-python → Connects Python to Snowflake.
snowflake-snowpark-python → Provides Snowpark functionality for Python.
'''


from snowflake.snowpark import Session

# defines Snowflake connection params
connection_params = {
    "account": "<your_account>",     # eg: 'xyz123.region'
    "user": "<your_username>",
    "password": "<your_password>",
    "role": "<your_role>",           # eg: 'ACCOUNTADMIN'
    "warehouse": "<your_warehouse>", # eg: 'COMPUTE_WH'
    "database": "<your_database>",
    "schema": "<your_schema>"
}

# create a Snowflake session
session = Session.builder.configs(connection_params).create()
print("Connected to Snowflake successfully!")

# close the session
session.close()


