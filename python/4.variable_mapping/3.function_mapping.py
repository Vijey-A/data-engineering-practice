# 3. Function mapping:




# eg:1 -> function that maps number to its square

def square(x):
    return x * x


result = square(4)  # mapping variable 4
print("Square root: ",result)






# eg:2 -> mapping salary data and finding tax

# employees = [{"name": "John", "salary": 50000}, {"name": "Alice", "salary": 60000}]
employees = [
    {"name": "Sam", "salary": 50000},
    {"name": "Pradhap", "salary": 60000},
    {"name": "Bala", "salary": 70000}
]

# function to calculate salary after tax deduction
def apply_tax(employee):
    tax_rate = 0.2
    employee["salary_after_tax"] = employee["salary"] * (1 - tax_rate)
    return employee

# applying the function to each employee
transformed_employees = list(map(apply_tax, employees))

print("Transformed Employee List: ", transformed_employees)
