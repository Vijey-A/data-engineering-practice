-- SUBQUERIES

# subquery is basically a query within another query.

# few differnt ways to achieve this:
#. 1. Subqueries in WHERE Clause.
#. 2. Subqueries in SELECT Clause.
#. 3. Subqueries in FROM Clause.


#. 1. Subqueries in WHERE Clause.


SELECT *
FROM employee_demographics
WHERE employee_id IN (
				SELECT employee_id
					FROM employee_salary
					WHERE dept_id = 1);

-- IN is the OPERATOR.
-- () - query within bracktes are called OPERATOR.
                    
-- assume OPERAND(SELECT employee_id, dept_id FROM employee_salary WHERE dept_id = 1);, we wil get ERROR (Operand should contain only one column)




# cross checking the scenario witj joins
SELECT *
FROM employee_demographics emp
LEFT JOIN employee_salary sal
	ON emp.employee_id = sal.employee_id
WHERE dept_id = 1;

# when used JOINs, instead of selecting the data from employee_demographics table, both tables are joined and then data is fectched accordingly.
# but when used subquery, It target the specific use case column.
# when executing millions of dataset, it does make a difference.






-- 2. Subqueries in SELECT Clause.

# compare salary for everyone, check if salary is above average or below avergae

SELECT
	first_name,
	salary,
    (SELECT avg(salary) 
		FROM employee_salary)
FROM employee_salary;




-- 3. Subqueries in FROM Clause.

# group by by gender col, and aggragate func.

SELECT 
	gender, min(age), max(age), avg(age), count(age) 
FROM employee_demographics
GROUP BY gender;

# considering the scenaorio, need avergae of oldest age or avg of smallest ages or avg count of female and males.
# we can't do that use above query. We use subquery for that.


SELECT 
	avg(`min(age)`), # we use backticks,since we didn't assign a name to the column
    avg(max_age),
    avg(avg_age),
    avg(age_count)
FROM 
	(SELECT gender, min(age), max(age) as max_age, avg(age) as avg_age, count(age) as age_count
	FROM employee_demographics
	GROUP BY gender) AS aggregated_table;




