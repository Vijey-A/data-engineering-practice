-- CTEs - Common Table Expressions

# use CTE's to perform more advanced calculation and have better readability. 
# it defines a subquery and reference with the main query.(basically subquery)

# in simpler term, its like query with in a query, except we will name the subquery block in CTE's and make it standardize and format it better.

--  WITH  -> keyword to define our CTE's


WITH CTE_salary AS
(
SELECT gender, AVG(salary) AS avg_salary, MIN(salary) AS min_salary, MAX(salary) AS max_salary, COUNT(salary) AS count_salary
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
)
SELECT AVG(avg_salary)
FROM CTE_salary;



# we can give "default colunm name, where if ALIAS is given, it will be overridden by CTE's default column name.

WITH CTE_salary (Gender, AVG_Sal, MIN_Sal, MAX_Sal, COUNT_Sal) AS
(
SELECT gender, AVG(salary) AS avg_salary, MIN(salary) AS min_salary, MAX(salary) AS max_salary, COUNT(salary) AS count_salary
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
)
SELECT *
FROM CTE_salary;



# same query using subqueries. (without CTE) 

SELECT AVG(avg_salary)
FROM (
SELECT gender, AVG(salary) AS avg_salary, MIN(salary) AS min_salary, MAX(salary) AS max_salary, COUNT(salary) AS count_salary
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender
) salary_subquery; 



# we can only use the CTE's, immediately after we built/created it.
SELECT *
FROM CTE_salary;



# more complex CTE example.
-- we can use more than one CTE in a query.

WITH CTE_salary AS
(
SELECT employee_id, gender, birth_date
FROM employee_demographics
WHERE birth_date > '1985-01-01'
),
CTE_salary2 AS
(
SELECT employee_id, salary
FROM employee_salary
WHERE salary > 50000
)
SELECT *
FROM CTE_salary
JOIN CTE_salary2
	ON CTE_salary.employee_id = CTE_salary2.employee_id;



