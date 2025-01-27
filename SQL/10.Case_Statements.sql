-- CASE statements

# allows us to do logic in SELECT statement, and can have mulitple WHEN statement
# sort of like 'IF' statements in coding.

SELECT first_name, last_name, age,
CASE
	WHEN age < 30 THEN 'Young'
    WHEN age BETWEEN 30 and 50 THEN 'Old'
    WHEN age > 50 THEN "On Death's Door"
END as age_brackets
FROM employee_demographics;





-- pay increases and bonus on the end of the year scenario 
# < 50000 = 5% raise
# > 50000 = 7% raise
# Finance Dept = 10% bonus


SELECT emp.first_name, emp.last_name, emp.salary, pdept.department_id, pdept.department_name,
CASE
	WHEN emp.salary < 50000 THEN emp.salary + (emp.salary * 0.05)
    WHEN emp.salary > 50000 THEN emp.salary + (emp.salary * 0.07)
END AS new_salary,
CASE
	WHEN pdept.department_name = 'Finance' THEN (emp.salary * 0.10)
END AS bonus
FROM employee_salary as emp
JOIN parks_departments as pdept
	ON emp.dept_id = pdept.department_id;


