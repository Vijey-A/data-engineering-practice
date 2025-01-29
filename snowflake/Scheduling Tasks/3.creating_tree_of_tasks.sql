USE TASK_DB;

SHOW_TASKS;

SELECT* FROM CUSTOMERS;

-- Prepare a second table

CREATE OR REPLACE TABLE CUSTOMERS2(
  CUSTOMER_ID INT,
  FIRST_NAME VARCHAR(40),
  CREATE_DATE DATE);


-- Suspend parent task
-- before modifying anything in the tree of tasks theroot task need to be suspended(if not error popup)

ALTER TASK CUSTOMER_INSERT SUSPEND; #root task



-- create child task to fetch data from table1 and insert into table2

CREATE OR REPLACE TASK CUSTOMER_INSERT2
	WAREHOUSE = FIRST_WH
    AFTER CUSTOMER_INSERT
    AS
    INSERT INTO CUSTOMERS2 SELECT * FROM CUSTOMERS;
 
 
 
 -- preparing a third table
 CREATE OR REPLACE TABLE CUSTOMERS3(
  CUSTOMER_ID INT,
  FIRST_NAME VARCHAR(40),
  CREATE_DATE DATE)
  INSERT_DATE DATE DEFAULT DATE(CURRENT_TIMESTAMP);
  


 -- create\ing another child task to fetch data from table2 and insert into table3

CREATE OR REPLACE TASK CUSTOMER_INSERT3
	WAREHOUSE = FIRST_WH
    AFTER CUSTOMER_INSERT2
    AS
    INSERT INTO CUSTOMERS3(CUSTOMER_ID, FIRST_NAME, CREATE_DATE) SELECT * FROM CUSTOMERS2;



SHOW TASKS;


-- we can update a task too
ALTER TASK CUSTOMER_INSERT
SET SCHEDULE = '1 MINUTE';



-- resuming from child tasks
-- first resume child tasks
ALTER TASK CUSTOMER_INSERT3 RESUME;
ALTER TASK CUSTOMER_INSERT2 RESUME;

-- then resume root task
ALTER TASK CUSTOMER_INSERT RESUME;


-- we can slso recursively resume a specified task and all its dependent tasks
SELECT SYSTEM$TASK_DEPENDENTS_ENABLE( 'CUSTOMER_INSERT' )



select * from CUSTOMERS;
select * from CUSTOMERS2;
select * from CUSTOMERS3;


-- note that the credits are consuemd, suspend the task if not used.
ALTER TASK CUSTOMER_INSERT SUSPEND; 
ALTER TASK CUSTOMER_INSERT2 SUSPEND; 
ALTER TASK CUSTOMER_INSERT3 SUSPEND; 
