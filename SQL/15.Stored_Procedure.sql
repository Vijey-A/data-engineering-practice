-- STORED PROCEDURE

-- way to use SQL code, over and over again.
# call the store procedure and execute the query within the stored procedure.

 
CREATE PROCEDURE large_salary_employees()
SELECT *
FROM employee_salary
WHERE salary >= 50000;

CALL large_salary_employees();

# to delete a procedure
DROP PROCEDURE IF EXISTS large_salary_employees; 


-- STORED PROCEDURE for mulitple queries

CREATE PROCEDURE large_salary_employees2()
SELECT *
FROM employee_salary
WHERE salary >= 50000;
SELECT *
FROM employee_salary
WHERE salary >= 10000;

# in the above created procedure, the stored procedures result are not right.
# It first creates a PROCEDURE only for the first SELECT statement. 
# And consider the second  SELECT statement as different query.

# it is bad practice, when creating procedure for multiple queries.


-- best practice for storing multiple queries in a procedure, is to use DELIMITER (i.e semicolon)

# semicolon separate queries from one another.
# delimeter tells mySQL the query is ended and dont mix with one another and cause errors.

# we can change the DELIMITER. 
# Common proactice is to use '$$' two dollor sign or '//' two forward slashes.


DELIMITER $$
CREATE PROCEDURE large_salary_employees3()
BEGIN
	SELECT *
	FROM employee_salary
	WHERE salary >= 50000;
	SELECT *
	FROM employee_salary
	WHERE salary >= 10000;
END $$
DELIMITER ;

CALL large_salary_employees3();





-- PARAMETER

# Paramter are variables that are passed as a input to a stored procedure.
# USE CASE : when employee ID is given , we need salary of that employee.

# best practice : we can pass employee_id as paramter, since, it confusing in large codebase.
# use "employee_id_param" or "p_employee_id"

DELIMITER $$
CREATE PROCEDURE large_salary_employees4_parameter(p_employee_id INT)
BEGIN
	SELECT salary
	FROM employee_salary
    WHERE employee_id = p_employee_id;
END $$
DELIMITER ;

CALL large_salary_employees4_parameter(1);
CALL large_salary_employees4_parameter(5);
CALL large_salary_employees4_parameter(8);



