-- WINDOWS FUNCTION
# windows function are powerful and are somewhat like a GROUP BY, except they dont roll every row into one row when grouping.
# windows function allow us to look at a partition or a group, but they each keep their own unique rows in the output.

-- Common Window Functions:
# Ranking Functions: ROW_NUMBER(), RANK(), DENSE_RANK()
# Lag and Lead Functions: LEAD(), LAG()
# Value Functions: FIRST_VALUE(), LAST_VALUE()
# Aggregation Functions: SUM(), AVG(), COUNT(), MIN(), MAX()


-- HAND'S ON

SELECT gender, avg(salary) as avg_salary
FROM employee_demographics as dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id
GROUP BY gender;

-- in the above query, its rolled into Female and Male gender.

-- OVER() - functions have individual rows
# avg_salary over everything

SELECT gender, avg(salary) OVER()  
FROM employee_demographics as dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id;
    


-- PARTION BY - does not roll up column and we can perform operations based on the provided column.

SELECT gender, avg(salary) OVER(PARTITION BY gender) 
FROM employee_demographics as dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id;


 # if we try to fetch 'dem.first_name' 'dem.last_name', we need to GROUP BY and the values fetched are not correct.
 # but in WONDOWS FUNCTIONS, it completly independent of what happens, bcuz functions affect only derisred column(in this case avg(salary))
 
SELECT dem.first_name, dem.last_name, gender, avg(salary) OVER(PARTITION BY gender)
FROM employee_demographics as dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id;

SELECT 
	dem.first_name,
	dem.last_name,
	gender,
    avg(salary) OVER(PARTITION BY gender),
    sum(salary) OVER(PARTITION BY gender)
FROM employee_demographics as dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id;
    
    

#USE CASE - Rolling Total in finance and healthcare industries

SELECT 
	dem.employee_id,
    sal.employee_id,
	dem.first_name,
    dem.last_name,
    gender,
    salary,
    sum(salary) OVER(PARTITION BY gender ORDER BY dem.employee_id) AS Rolling_Total    
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id;



# Ranking Functions: 

# ROW NUMBER() - its like aggregate function, and increment its value by 1 for each row.

# RANK() - its like official rank and next rank is based on its position. When duplicates are encountered, it assigns same number.
            
# DENSE_RANK() -  when duplicates are encountered, it assigns same number as rank but, next rank is numbered numerically.


SELECT 
	dem.first_name, dem.last_name, gender, salary,
    ROW_NUMBER() OVER(PARTITION BY gender ORDER BY salary DESC) as row_num,
    RANK() OVER(PARTITION BY gender ORDER BY salary DESC) as rank_num,
    DENSE_RANK() OVER(PARTITION BY gender ORDER BY salary DESC) as dense_rank_num
FROM employee_demographics dem
JOIN employee_salary sal
	ON dem.employee_id = sal.employee_id;


UPDATE employee_demographics
SET gender = 'Male'
WHERE employee_id = 13;

SELECT * FROM employee_salary;







-- Lag and Lead Functions: 

# LEAD() - provides access to the next row's value in the result set without needing a self-join. Used to compare the current row to the next row.
-- SYNTAX - LEAD(column, offset, default_value) OVER (PARTITION BY column ORDER BY column)
# if deafult_value is not given, then it takes as NULL.

# query to display the salary of an employee to the next employee (with 2 employee difference.)
SELECT 
	first_name, last_name, dept_id, salary,
    LEAD(salary, 2, 0) OVER (partition by dept_id ORDER BY salary DESC) as next_salary
FROM employee_salary;



# LAG() - provides access to the previous row's value in the result set. Used to compare the current row to the previous row.
-- SYNTAX: LAG(column, offset, default_value) OVER (PARTITION BY column ORDER BY column)

# query to display the salary of an employee to the previous employee (with 3 employee difference.)
SELECT 
	first_name, last_name, dept_id, salary,
    LAG(salary, 3, 'nil') OVER (partition by dept_id ORDER BY salary DESC) as next_salary
FROM employee_salary;



# USE CASE: to display if the salary of an employee is higher, lower or equal to the previous employee.

SELECT 
	*,
    LAG(salary) OVER (partition by dept_id ORDER BY employee_id DESC) as prev_emp_salary,
CASE
	WHEN salary > LAG(salary) OVER (partition by dept_id ORDER BY employee_id DESC) THEN 'Higher than previous employee'
	WHEN salary < LAG(salary) OVER (partition by dept_id ORDER BY employee_id DESC) THEN 'Lower than previous employee'
	WHEN salary = LAG(salary) OVER (partition by dept_id ORDER BY employee_id DESC) THEN 'Equal to the previous employee'
END as compare_with_previous_employee
FROM employee_salary;








-- Value Functions:

# FIRST_VALUE() 
	-- returns the first value in an ordered set of rows.
    
# query to get lowest salaried employee with in same department.
SELECT
    *,
    FIRST_VALUE(first_name) OVER(PARTITION BY dept_id ORDER BY salary) AS lowest_salaried_employee
FROM employee_salary;


# LAST_VALUE() 
	-- returns the last value in an ordered set of rows.
    
 -- if 10 rows are present, the first row will take the last value as first row's value. for second row, it compare btw first and second and return result.
 -- so we use ROWS BETWEEN, where UNBOUNDED PRECEDING is first row , UNBOUNDED FOLLOWING is last row and CURRENT ROW is current row.)


# USE CASE: query to get lowest and hghest salaried employee with in same department and compare.

SELECT
    *,
    FIRST_VALUE(first_name) OVER(PARTITION BY dept_id ORDER BY salary) AS lowest_salaried_employee,
    LAST_VALUE(first_name) OVER(PARTITION BY dept_id ORDER BY salary ROWS BETWEEN CURRENT ROW AND UNBOUNDED FOLLOWING) AS highest_salaried_employee
FROM employee_salary;

