-- creating a stored procedure

USE TASK_DB;

SELECT * FROM CUSTOMERS;

-- Creating Procedure
CREATE OR REPLACE PROCEDURE CUSTOMERS_INSERT_PROCEDURE (CREATE_DATE varchar)
	RETURN STRING NOT NULL
    LANGUAGE JAVASCRIPT
    AS
    	$$
        var sql_command = 'INSERT INTO CUSTOMERS(CREATE DATE) VALUES(:1);'
        snowflake.execute(
          {
          sqlText : sql_command,
          binds : [CREATE_DATE]
          });
        return "Successfully executed.";
        $$


-- Creating Task for Procedure
CREATE OR REPLACE TASK CUSTOMER_TASK_PROCEDURE
	WAREHOUSE = FIRST_WH
    SCHEDULE = "1 MINUTE"
    AS CALL CUSTOMERS_INSERT_PROCEDURE(CURRENT_TIMESTAMP);
    
 
 SHOW TASKS;
 
 -- TASK IS SUSPENDED
alter TASK CUSTOMER_TASK_PROCEDURE RESUME;

SELECT * FROM CUSTOMERS;

