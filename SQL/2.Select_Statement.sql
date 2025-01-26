select * 
from parks_and_recreation.employee_demographics;

select 
	first_name,
	employee_id,
    age,
    (age + 10) * 10 as plusTenAge
from
	parks_and_recreation.employee_demographics;

#PEMDAS - Order of operation/execution for Arithmetic or Math in mySQL (that run in mySQL excution engine.)
# stands for Parenthesis, Exponent, Multiplication, Division, Addition, Subtraction.

select distinct gender, first_name
from parks_and_recreation.employee_demographics;

