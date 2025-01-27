-- TRIGGERS and EVENTS

-- Trigger is a block of code that executes automatically, when a event takes place on a specific table.

SELECT *
FROM employee_salary;

SELECT *
FROM employee_demographics;

# when a new employee is hired , they are put into "Employee Salary" table. 
# and they forget to add entries in "Employee Demographics" table, which is necessity.
# to automatically update specific column, we use trigger.


# the trigger below is used, when data is add into salary table, it get automatically added in demographics table.

DELIMITER $$
CREATE TRIGGER employee_insert
	AFTER INSERT ON employee_salary
	FOR EACH ROW
BEGIN
	INSERT INTO employee_demographics(employee_id, first_name, last_name)
    VALUES (NEW.employee_id, NEW.first_name, NEW.last_name);
END $$
DELIMITER ;


# note : we can use 'BEFORE DELETE ON' trigger to save the data of employee as backup.
# to take new value that just inserted, we use 'NEW' keyword
# for updation, we use 'OLD' keyword


INSERT INTO employee_salary (employee_id, first_name, last_name, occupation, salary, dept_id)
VALUES (13, 'Kiyane', 'Reeves', 'Actor', '50000000', NULL);





-- EVENTS

# trigger happens when an event takes place whereas Event takes place for a schedule

# USE CASE: import data, export files, daily activity and automations.


DELIMITER $$
CREATE EVENT delete_retirees
ON SCHEDULE EVERY 30 SECOND
DO
BEGIN
	DELETE
	FROM employee_demographics
	WHERE age>= 60;
END $$
DELIMITER ;


# we can also schedule it 'EVERY 30 DAYS',  MONTH or YEAR.

SELECT *
FROM employee_demographics;

# we can 

-- we can check if the SCHEDULER is ON/OFF by below command
SHOW VARIABLES;
SHOW VARIABLES LIKE 'event%';
 