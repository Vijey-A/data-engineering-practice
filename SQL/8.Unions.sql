-- Unions
# allow us to combine row together/ row of data from same tables or separate tables.(Not like columns with join, where one column is next to other column)
# achieve by -> one SELECT statement, and take UNION to combine with other SELECT statements.

# UNION DISTINCT/ UNION -> removes duplicates. By default UNION is DISTINCT, we dont need to mention it.
# UNION ALL -> doesn't remove duplicates.

# UNION DISTINCT/ UNION -> removes duplicates.
SELECT first_name, last_name
FROM employee_demographics
UNION
SELECT first_name, last_name
FROM employee_salary;


# UNION ALL -> doesn't remove duplicates.
SELECT first_name, last_name
FROM employee_demographics
UNION ALL
SELECT first_name, last_name
FROM employee_salary;


# USE CASE: to find name of the elderly employee for both gender and highly paid employee.

SELECT first_name, last_name, 'Old-Man' AS label
FROM employee_demographics
WHERE age > 40 and gender = 'Male'
UNION
SELECT first_name, last_name, 'Old-Lady' AS label
FROM employee_demographics
WHERE age > 40 and gender = 'Female'
UNION
SELECT first_name, last_name, 'Highly Paid Employee' AS label
FROM employee_salary
WHERE salary > 70000
ORDER BY first_name, last_name;