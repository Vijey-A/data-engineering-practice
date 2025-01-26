-- JOINS
# Joins allows us to combine two tables or more together, if they have commom column.
# (that doesn't means two tables should have same exact colum name, atleast the data within it are similar to use)

DESC employee_demographics;
DESC employee_salary;
DESC parks_departments;

SELECT *
FROM parks_and_recreation.employee_demographics;

SELECT *
FROM parks_and_recreation.employee_salary;

-- INNER JOIN
# return rows that are same in both columns from both tables.

SELECT
	dem.employee_id,
    age, occupation, salary
FROM employee_demographics AS dem
INNER JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id;

-- OUTER JOIN
# left join or left outer join -> it takes everything from the left table and only takes matches from right table.
# right join or right outer join -> it takes everything from the right table and only takes matches from left table.

# if there is not a match, it will populate that row as "NULL" in it.

# and if the information is same, it will bring over to the original row. 
# (When doing left join, emp id = 1 is same in the right table too. So, it bring over the right table data to the left table.)

SELECT *
FROM employee_demographics AS dem
LEFT JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id;

SELECT *
FROM employee_demographics AS dem
RIGHT JOIN employee_salary AS sal
	ON dem.employee_id = sal.employee_id;




-- SELF JOIN
# self join where we ties the table to itself.

# example usecase: employee secret santa, where employee give secret gifts to next employee according to their employee.
SELECT
	emp1.employee_id AS emp_santa,
    emp1.first_name AS first_name_santa,
   	emp2.employee_id AS emp_name,
    emp2.first_name AS first_name_emp
FROM employee_salary emp1
JOIN employee_salary emp2
	ON emp1.employee_id + 1 = emp2.employee_id;





-- joining multiple table together

# we consider tables like parks_departments as REFERENCE TABLE, as it doesn't get changed often like employee and salary table.
# also, reference tables often does not have duplicates.
# we can only use multi join here, because 'employee_demographics' is tied to 'employee_salary' and 'employee_salary' is tied to 'parks_departments'.

SELECT *
FROM employee_demographics as dem
INNER JOIN employee_salary as sal
	ON dem.employee_id = sal.employee_id
INNER JOIN parks_departments as pd
	ON sal.dept_id = pd.department_id;


SELECT 
	pd.department_name,
    count(dept_id) AS dept_id_count,
    max(salary) AS maximum_salary,
    min(salary) AS minimum_salary,
	max(age) AS maximum_age,
    min(age) AS minimum_age
FROM employee_demographics as dem
INNER JOIN employee_salary as sal
	ON dem.employee_id = sal.employee_id
INNER JOIN parks_departments as pd
	ON sal.dept_id = pd.department_id
GROUP BY pd.department_name;

