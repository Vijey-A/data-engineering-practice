-- creating DB and preparing table

CREATE OR REPLACE TRANSIENT DATABASE TASK_DB;

CREATE OR REPLACE TABLE CUSTOMERS(
  CUSTOMER_ID INT AUTOINCREMENT START=1 INCREMENT=2,
  FIRST_NAME VARCHAR(40) DEFAULT 'ROCKY'
  CREATE_DATE(DATE)
)


-- Create Task
-- we are creating server tasks (multi cluster servers are preferable for seamless task execution).
-- schedule should be mentioned in minutes(1 hour = 60 minutes).
-- if its serverless, snowflake will manage task for us


CREATE OR REPLACE TASK CUSTOMER_INSERT
	WAREHOUSE = FIRST_WH
                SCHEDULE = '1 MINUTE'
                AS
                INSERT INTO CUSTOMERS(CREATE_DATE) VALUE(CURRENT_TIMESTAMP)
    

-- to view task

SHOW TASKS;


-- by default task is SUSPENDED
-- to start or suspend a task

ALTER TASK CUSTOMER_INSERT RESUME;
ALTER TASK CUSTOMER_INSERT SUSPEND;


SELECT * FROM CUSTOMERS;