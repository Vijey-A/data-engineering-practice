-- loading data into snowflake from S3 (direct way)

USE ROLE ACCOUNTADMIN;


ALTER DATABASE FIRST_DB RENAME TO OUR_FIRST_DB


CREATE TABLE “OUR_FIRST_TABLE”. “PUBLIC”. “LOAN+PAYMENT”(
  "Loan_Id" INT,
  "Loan_status" VARCHAR(100),
  "Principal" INT,
  "terms" VARCHAR(1000),
  "effective_date" DATETIME,
  "due_date" DATETIME,
  "paid_off_time" DATETIME,
  "past_due_days" STRING,
  "age" INT,
  "education" VARCHAR(150),
  "Gender" VARCHAR(150)
)


USE DATABASE OUR_FIRST_DB;


COPY INTO LOAN_PAYMENT
	FROM s3://bucketsnowfake3/loan_payments_data.csv
                file_format = (type = csv
                               field_delimiter = ','
                               skip_header=1)


SELECT * FROM LOAN_PAYEMENT;


