-- setting up warehouse in SQL

USE ROLE SYSADMIN;


CREATE OR REPLACE WAREHOUSE FIRST_WH
WITH
WAREHOUSE_SIZE = XSMALL
COMMENT = 'FIRST_WH is the WAREHOUSE_NAME. We can add description of the warehouse here'




-- when the above query is created and it activates automatically. We can suspend it and there are other param features too.

CREATE OR REPLACE WAREHOUSE FIRST_WH
WITH
WAREHOUSE_SIZE = XSMALL
AUTO_RESUME = TRUE
AUTO_SUSPEND = 300
SCALING_POLICY = 'Economy'
MIN_CLUSTER_COUNT = 1
MAX_CLUSTER_COUNT = 3
INITIALLY_SUSPENDED = TRUE
COMMENT = 'FIRST_WH is the WAREHOUSE_NAME. We can add description of the warehouse here'



