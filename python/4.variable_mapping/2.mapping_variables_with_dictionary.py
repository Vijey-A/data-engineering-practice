# 2. Mapping variables with dictionaries:





# eg: 1 - creating dictionary to map names to ages

person_age = {"Vijey": 28, "Uma": 24, "Sharukh": 30}

# accessing value using the key (mapping)

mapped_age = person_age["Sharukh"]
print("Age: ", mapped_age)





# eg:2 -> dictionary mapping product ID to product price

product_prices = {
    "shoes": 100,
    "rope": 150,
    "bag": 200
}

# mapping product IDs to their prices
product_id = "ropes"
product_price = product_prices.get(product_id, "Product not found")

print(f"Price of product {product_id}: {product_price}")




