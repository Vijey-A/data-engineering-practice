-- HAVING vs WHERE

SELECT gender, AVG(age)
FROM parks_and_recreation.employee_demographics
WHERE AVG(age) > 40 # ERROR CODE: 1111. Invalid use of group function
GROUP BY gender; 

# HAVING was specificly created for this exact above scenario. (correct answer is below)
# 1) it comes right after GROUP BY and 
# 2) filter based on the aggregate function.

SELECT gender, AVG(age)
FROM parks_and_recreation.employee_demographics
GROUP BY gender
HAVING AVG(age) > 20;



SELECT occupation, avg(salary)
FROM parks_and_recreation.employee_salary
WHERE occupation LIKE '%manager%'  # filter at row level
GROUP BY occupation
HAVING avg(salary) > 75000; # filter at aggregate function level and comes after GROUP BY
