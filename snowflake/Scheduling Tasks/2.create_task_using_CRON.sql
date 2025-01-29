CREATE OR REPLACE TASK CUSTOMER_INSERT
	WAREHOUSE = FIRST_WH
        SCHEDULE = '60 MINUTE'
        AS
        INSERT INTO CUSTOMERS(CREATE_DATE) VALUE(CURRENT_TIMESTAMP);
 

SHOW TASKS;


-- using CRON
-- SYNTAX 

-- Every minute
SCHEDULE = 'USING CRON * * * * * UTC';

-- Every day at 6am UTC timezone
SCHEDULE = 'USING CRON 0 6 * * * UTC';

-- Every hour starting at 9 AM and ending at 5 PM on Sundays 
SCHEDULE = 'USING CRON 0 9-17 * * SUN Asia/Kolkata;

# __________ minute (0-59)
# | ________ hour (0-23)
# | | ______ day of month (1-31, or L)
# | | | ____ month (1-12, JAN-DEC)
# | | | | __ day of week (0-6, SUN-SAT, or L)
# | | | | |
# | | | | |
# * * * * *


-- Every day from 9 am to 5 pm
CREATE OR REPLACE TASK CUSTOMER_INSERT
    	WAREHOUSE = FIRST_WH
    	SCHEDULE = 'USING CRON 0 9,17 * * * UTC'
    	AS 
    	INSERT INTO CUSTOMERS(CREATE_DATE) VALUES(CURRENT_TIMESTAMP);
    

-- Every Monday to Friday at January month at 8 pm
CREATE OR REPLACE TASK CUSTOMER_INSERT
	WAREHOUSE = FIRST_WH
    	SCHEDULE = 'USING CRON 0 20 * JAN MON-FRI UTC'
    	AS
    	INSERT INTO CUSTOMERS(CREATE_DATE) VALUE(CURRENT_TIMESTAMP);
