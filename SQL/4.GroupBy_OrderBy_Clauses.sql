-- Group by Clause
-- group together the rows that have the same value in the specified columns that we are grouping on. once grouped, we run aggrgate functions on those rows.


SELECT first_name
FROM parks_and_recreation.employee_demographics
GROUP BY gender;
-- we wil get Error Code: 1055. Expression #1 of SELECT list is not in GROUP BY clause and contains nonaggregated column 'parks_and_recreation.employee_demographics.first_name' which is not functionally dependent on columns in GROUP BY clause.c
-- means 'first_name' is not in GROUP BY clause and it not aggregated column either. So we got the error. 
-- in order for it to work, first_name should match group by clause.


SELECT gender, AVG(age)
FROM parks_and_recreation.employee_demographics
GROUP BY gender;
-- we could get the same output, by using SELECT DISTINCT, but GROUP BY is different.
-- it actually rolling up all the values into these rows.
-- when we run aggregate func like min, max, avg. We wil do it based on these rows and all these are rolled up into Female and Male as we grouped by in gender.


SELECT DISTINCT gender, avg(age)
FROM parks_and_recreation.employee_demographics; # error: 1140. in aggregated query without GROUP BY.
-- aggragte function cannotnbe used without GROUP BY clause.


SELECT 
	occupation, 
    AVG(salary),
    COUNT(salary)
FROM parks_and_recreation.employee_salary
GROUP BY occupation;

SELECT
	gender,
    avg(age)as avg_age,
    min(age),
    max(age),
    count(age)
FROM parks_and_recreation.employee_demographics
GROUP BY gender
ORDER BY avg_age DESC;
	








-- ORDER BY -> arrange in ascending or descending order.

SELECT 
	employee_id, first_name, age, gender, birth_date
FROM 
	parks_and_recreation.employee_demographics
ORDER BY 
	gender DESC,
    age ASC;
    
SELECT 
	employee_id, first_name, age, gender
FROM 
	parks_and_recreation.employee_demographics
WHERE
	age between 30 and 40
ORDER BY
    age ASC;
    
SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY 5 DESC,4;   # here 5 and 4 are column position count and its bad practice. If any column from 1 to 3 is deleted, then 5 and 4 point to different column
