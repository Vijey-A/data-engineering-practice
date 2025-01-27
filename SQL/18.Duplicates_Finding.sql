-- Duplicates Finding

SELECT * from employee_demographics;
SELECT * from employee_salary;

UPDATE employee_demographics
SET birth_date = '1980-11-11'
WHERE employee_id = 13;



-- 1. based on single column.

# query to find duplicates where employees share the same birth_date.

SELECT 
	birth_date,
    COUNT(*) AS duplicate_count
FROM 
    employee_demographics
GROUP BY 
    birth_date
HAVING 
    COUNT(*) > 1;




-- 2. based on multiple column.

SELECT 
    first_name, 
    last_name, 
    occupation, 
    COUNT(*) AS duplicate_count
FROM 
    employee_salary
GROUP BY 
    first_name, last_name, occupation
HAVING 
    COUNT(*) > 1;

INSERT INTO employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
VALUE (16, 'Donna', 'Meagle', 'Office Manager',	60000, 1);





-- 3. duplicates accross two tables based on a key

# for employees who exist in both employee_demographics and employee_salary based on the employee_id.

SELECT 
    d.employee_id, 
    d.first_name AS demographics_first_name,
    d.last_name AS demographics_last_name,
    s.first_name AS salary_first_name,
    s.last_name AS salary_last_name
FROM 
    employee_demographics d
JOIN 
    employee_salary s
ON 
    d.employee_id = s.employee_id
GROUP BY 
    d.employee_id, d.first_name, d.last_name
HAVING 
    COUNT(*) > 1;





-- 4. using windows functinon

# query to identify and rank duplicate entries by first_name and last_name.

WITH RankedEmployees AS (
    SELECT 
        employee_id,
        first_name, 
        last_name,
        ROW_NUMBER() OVER (PARTITION BY first_name, last_name ORDER BY employee_id) AS row_num
    FROM 
        employee_salary)
SELECT 
	*
FROM 
    RankedEmployees
WHERE 
    row_num > 1;






--  5. multiple columns with aggregation

# query to find duplicate employees who have the same dept_id and salary.

SELECT 
    dept_id, 
    salary, 
    COUNT(*) AS duplicate_count
FROM 
    employee_salary
GROUP BY 
    dept_id, salary
HAVING 
    COUNT(*) > 1;



