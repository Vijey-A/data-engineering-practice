-- LIMIT

-- find top 3 eldest people
SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY age DESC
LIMIT 3;

SELECT *
FROM parks_and_recreation.employee_demographics
ORDER BY age DESC
LIMIT 2,4; 
-- 2 is the starting postion in age.
-- and it take 4 values after the starting 2nd position (take value of 3,4,5,6)



-- ALIASING - way to change the name of the column

SELECT gender, avg(age) AS avg_age
FROM parks_and_recreation.employee_demographics
GROUP BY gender
HAVING avg_age > 40;