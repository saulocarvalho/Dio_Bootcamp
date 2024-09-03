import json

my_list = [1, 2, 3, "four", "five"]

json_string = json.dumps(my_list)

with open("TestJson.json", "w") as file:
    file.write(json_string)
