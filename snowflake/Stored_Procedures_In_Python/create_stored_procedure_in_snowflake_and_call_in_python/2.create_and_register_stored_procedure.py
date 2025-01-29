'''
This script creates a stored procedure in Snowflake with Python using Snowpark
'''

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


# assuming there is employee table in snowflake
# define the stored procedure function to count no of employees
def employee_count(session):
    df = session.sql("SELECT COUNT(*) FROM employees")
    result = df.collect()
    return result[0][0]


# register the stored procedure in snowflake
session.sproc.register(
    func=employee_count,        # python function
    name="get_employee_count",  # stored procedure name to store in snowflake
    replace=True,               # replace if already exists
    return_type=int,            # return type of procedure
    input_types=[]              # no input parameters
)

print("Stored procedure 'get_employee_count' created successfully!")


# we can call the stored procedure immediately after creating it
result = session.sql("CALL get_employee_count();").collect()
print("Employee Count:", result[0][0])


session.close()
