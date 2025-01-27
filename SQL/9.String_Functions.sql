-- String Functions
# built in functions of mysql


-- LENGTH()

SELECT length('skyfall');

SELECT
	first_name,
    length(first_name)
FROM employee_demographics
ORDER BY 2;
# real time use case: Phone number check (10 character long)


-- UPPER()
SELECT upper('skyfall');
SELECT lower('SKYFALL');

SELECT
	first_name,
    upper(first_name)
FROM employee_demographics;



-- TRIM()
# trim - take whitespaces out.
# left trim - take whitespaces at the beginning.
# right trim - take whitespaces at the end.

SELECT trim('          sky             ');
SELECT ltrim('          sky             ');
SELECT rtrim('          sky             ');


-- SUBSTRING() - fetch the characters by positions.
# left
# right
# substring


SELECT
	first_name,
    left(first_name, 4), # first four character
    right(first_name, 3), # last 3 character
    substring(first_name, 3,2),  # from 3rd postion, consider 2 values
    birth_date,
    substring(birth_date, 6,2)
FROM employee_demographics;


-- REPLACE
# replace specific character with different character I want.

SELECT first_name, replace(first_name, 'a', 'z')
FROM employee_demographics;



-- LOCATE
# specify the postion of a charcter in a string.

SELECT locate('i','vijey');

SELECT first_name, locate('r', first_name)
FROM employee_demographics;




-- CONCAT
# combine two column into single column

SELECT
	first_name,
    last_name,
    concat(first_name,' ' , last_name) AS full_name
FROM employee_demographics;






