# dictionary : to store and manage data in key-value pairs.
# unordered and mutable collection that provides fast lookups and is highly efficient for storing and retrieving data based on specific identifiers (keys).


# Basic dictionary structure
my_dict = {
    "key1": "value1",
    "key2": "value2",
    "key3": "value3"
}


# empty dict
empty_dict = {}


# access value using key
person = {"name": "Sam", "age": 28, "city": "Coimbatore"}
print("person['name'] -> ", person["name"])


# modify
person["age"] = 28
print("person['age']-> ", person["age"])


#add
person["job"] = "Lawyer"
print("Person Dict -> ", person)


# delete using del keyword
del person["city"]
print("Person Dict -> ", person)

# to delete and return value
age = person.pop("age")
print("Person Dict -> ", person)
print("Removed Key: ", age)


# checking if a key exists
if "name" in person:
    print("Name exists in the dictionary.")
else:
    print("Name doesn't exist.")





# eg:1 -> missing value in data

user_data = [
    {"user_id": 1, "name": "Raja", "age": None},
    {"user_id": 2, "name": "Maanikkam", "age": 27},
    {"user_id": 3, "name": "Muthu", "age": None}
]

# dict for default values
default_values = {
    "age": 25
}

# fill missing data
for record in user_data:
    for key, default_value in default_values.items():
        if record.get(key) is None:
            record[key] = default_value

print("User Data -> \n", user_data)





# eg 2:-> store metadata in congif files

config = {
    "db_host": "localhost",
    "db_port": 7070,
    "db_user": "rocking iruma",
    "source_db_password": "28&9&@63*!)",
    "target_file_path": "/data/output/file.csv"
}

# accessing configuration values
print(f"Connecting to database at {config['db_host']}:{config['db_port']}")
print(f"Target file path: {config['target_file_path']}")

