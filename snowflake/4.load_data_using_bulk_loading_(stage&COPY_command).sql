 

-- loading data into table and DB using Bulk loading which is most frequent method, Uses warehouses, 
-- Loading from stages, COPY command and Transformation is possible.



//create new DB for storing object

CREATE OR REPLACE DATABASE MANAGE_DB;

CREATE OR REPLACE SCHEMA external_stages;


-- It is good practice to use a separate database to store and manage stage objects, file formats etc.. 
-- And to refer to the stage, use @ command



// creating external stage 

CREATE OR REPLACE STAGE MANAGE_DB.external_stages.aws_stage
    url=’s3;//bucktesnowflakes3’
    credentials={aws_key_id=’ABCD_DUMMY_ID’  aws_secret_key= ‘1234_abcd_key’}



// Description on external stage

DESC STAGE MANAGE_DB.external_stages.aws_stage;



// alter external stage

ALTER STAGE aws_stage
    SET credentials=(aws_key_id=’XYZ_DUMMY_ID’ aws_secret_key = ‘978xyz’);



// publicly accessible storage area

CREATE OR REPLACE STAGE MANAGE_DB.external_stages.aws_stage
    url=’s3;//bucktesnowflakes3’;



// list files in stage

LIST @aws_stage




// load data into snowflake DB from S3 using COPY command

COPY INTO OUR_FIRST_DB.PUBLIC.ORDER
   FROM @aws_stage
   file_format = (type = csv field_delimiter=’,’ skip_header=1)
   pattern=’.*Order.*’;


