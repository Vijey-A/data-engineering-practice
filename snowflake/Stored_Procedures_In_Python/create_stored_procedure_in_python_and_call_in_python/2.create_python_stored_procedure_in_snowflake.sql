-- querying in snowflake
-- creating a stored procedure that returns the number of employees in a table. (assuming there is table)

CREATE OR REPLACE PROCEDURE get_employee_count()
RETURNS INT
LANGUAGE PYTHON
RUNTIME_VERSION = '3.8'
HANDLER = 'employee_count'
AS
$$
def employee_count(session):
    df = session.sql("SELECT COUNT(*) FROM employees")
    result = df.collect()
    return result[0][0]
$$;


-- LANGUAGE PYTHON → Defines the stored procedure in Python.
-- RUNTIME_VERSION = '3.8' → Specifies the Python version.
-- HANDLER = 'employee_count' → Defines the function to be called inside Snowflake.
-- session.sql(...) → Executes an SQL query in Snowflake.
-- df.collect() → Fetches results.

