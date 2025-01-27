-- Temporary Tables

-- only visible in the session they are created.

# store intermediate results for complex queries.(somewhat like CTE's).

# can also used to manipulate data, before it is inserted into a permanent table.

# - just lives in memory of computer. When the SQL application is closed or when session is over, the table will be deleted.





# two ways to create temp table.



-- 1. creating table from scratch

CREATE TEMPORARY TABLE temp_table
(
first_name varchar(50),
last_name varchar(50),
favorite_movie varchar(100)
);

select * from temp_table;

drop table temp_table;

CREATE TEMPORARY TABLE temp_table
(
first_name varchar(50),
last_name varchar(50),
favorite_movie varchar(100),
comments varchar(250)
);

select * from temp_table;

INSERT INTO temp_table
VALUES('Vijey', 'Anbarasan', 'Madarasapattinam', 'will recommend to friends');

select * from temp_table;





-- 2. creating table from existing table

CREATE TEMPORARY TABLE salary_over_60k
SELECT *
FROM employee_salary
WHERE salary > 60000;

SELECT * from salary_over_60k;



