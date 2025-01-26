-- WHERE Clause
SELECT *
FROM parks_and_recreation.employee_salary
WHERE first_name = 'Leslie';

SELECT *
FROM parks_and_recreation.employee_salary
WHERE salary <= 50000;

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE gender != 'Male';

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE birth_date > '1987-01-01';





-- LOGICAL OPERATORS
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE birth_date > '1987-01-01'
AND NOT gender = 'Male';

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE birth_date > '1987-01-01'
OR NOT gender = 'Male';

SELECT *
FROM parks_and_recreation.employee_salary
WHERE first_name = 'Leslie' or (occupation = 'Office Manager' and salary = 60000);

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE (first_name = 'Leslie' AND age = 44) OR age > 55;



-- LIKE statement - specific patterns
-- % percentage means anything
-- _ underscore means specific value
SELECT *
FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE 'j%';

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE '%y';

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE '%r%';

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE 'a__';

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE first_name LIKE 'a___%';

SELECT *
FROM parks_and_recreation.employee_demographics
WHERE birth_date LIKE '1989%';
