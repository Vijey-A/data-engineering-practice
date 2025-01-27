# 5. Using map() function:



# eg:1 ->  Transforing raw data


raw_data = [
    {"name": "Sam", "age": 28, "salary": "54000"},
    {"name": "Pradhap", "age": 24, "salary": "68000"},
    {"name": "Bala", "age": 30, "salary": "73000"}
]


# transform salary from string to int and increase by 10%
def process_record(row):
    row["salary"] = int(row["salary"]) * 1.10
    return row


# applying map function to process the raw data
processed_data = list(map(process_record, raw_data))

print("Processed data: ", processed_data)






# eg:2 ->  Cleaning phone number
def clean_phone_number(phone):
    return phone.replace("-", "").replace(" ", "")


raw_phones = ["123-456-7890", "987 654-3210", "555-888 1234"]
cleaned_phones = list(map(clean_phone_number, raw_phones))

print("Cleaned phone number list: ", cleaned_phones)


