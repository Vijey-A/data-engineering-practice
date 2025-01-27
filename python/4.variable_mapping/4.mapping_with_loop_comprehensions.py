# 4. Mapping using loops / comprehensions:




# eg: 1 -> mapping numbers to their squares using list comprehension
numbers = [1, 2, 3, 4, 5]

squares = [x ** 2 for x in numbers]  # mapping each number to its square
print("Square root of list: ", squares)




# eg: 2 -> mapping to calculate discount price

prices = [100, 200, 300, 400]

# mapping list comprehension to apply discount
discounted_prices = [price * 0.9 for price in prices]

print("Discounted Price: ", discounted_prices)
