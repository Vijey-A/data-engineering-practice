# if, elif and else statements - make decisions based on certain conditions.



# eg: handling errors during data processing

#records with some invalid entries
data = [
    {"id": 1, "value": 100},
    {"id": 2, "value": None},
    {"id": 3, "value": -50}
]


#using if, elif, else to handle errors

for record in data:
    if record["value"] is None:
        print(f"Error: Missing value for record {record['id']}.")
    elif record["value"] < 0:
        print(f"Error: Negative value for record {record['id']}.")
    else:
        print(f"Processing record {record['id']} with value {record['value']}.")




# eg: 2 -> find discount based on purchase range

transactions = [
    {"product": "apple", "total_price": 450},
    {"product": "banana", "total_price": 140},
    {"product": "orange", "total_price": 340}
]

# using if, elif, else to find different discount rates based on the total price
for transaction in transactions:
    if transaction["total_price"] > 400:
        transaction["discount"] = 0.4
    elif transaction["total_price"] > 300:
        transaction["discount"] = 0.3
    elif transaction["total_price"] > 200:
        transaction["discount"] = 0.2
    else:
        transaction["discount"] = 0

print("Transactional Price List: \n", transactions)


