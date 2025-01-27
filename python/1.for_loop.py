# for loop - to iterate over a sequence (such as a list, tuple, string, or dictionary) and execute the code.


# eg:1 -> data cleaning

# records with missing values
raw_data = [
    {"name": "Sam", "age": None, "salary": 50000},
    {"name": "Pradhap", "age": 24, "salary": None},
    {"name": "Bala", "age": 30, "salary": 70000}
]

# using for loop to clean data by filling missing values
for record in raw_data:
    if record["age"] is None:
        record["age"] = 28
    if record["salary"] is None:
        record["salary"] = 65000

print("Cleaned Data\n", raw_data)






# eg:2 -> removing records with a price below threshold

products = [
    {"product": "apple", "price": 430},
    {"product": "banana", "price": 140},
    {"product": "orange", "price": 340},
    {"product": "pear", "price": 390}
]

# Using a for loop to filter products with price >= 350
filtered_products = []
for product in products:
    if product["price"] >= 350:
        filtered_products.append(product)

print("Product with Price >= 350 Rupees: \n", filtered_products)


