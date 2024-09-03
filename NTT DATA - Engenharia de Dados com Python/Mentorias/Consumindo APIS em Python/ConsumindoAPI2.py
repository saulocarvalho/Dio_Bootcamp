import requests
import datetime
import os
import json

base_url = "https://swapi.dev/api/"

films_endpoint = "films/"

response = requests.get(base_url + films_endpoint)
if response.status_code == 200:
        data = response.json()
        filmes = []
        for movies in data ["results"]:
            info = {
                "Titulo": movies['title'],
                "Sequencia": movies['episode_id']
            }
            filmes.append(info)
            
else:
            print(response.status_code)

#Ordendando o filme pela ordem da sequencia
filmes_ordenados = sorted(filmes, key=lambda filme: filme["Sequencia"])

filmes_ordenados_inverso = sorted(filmes, key=lambda filme: filme["Sequencia"], reverse=True)


with open("movies.json", "w") as file:
        json.dump(filmes_ordenados, file,  indent=4)
with open("movies_reverse.json", "w") as file:
        json.dump(filmes_ordenados_inverso, file,  indent=4)
#    
# 
# 
# 
# 
# 
# data = response.json()
#
#    with open("response2.json", "w") as file:
#        json.dump(data, file, indent=4)
#
#        print("Dados salvos em response.json")

#else:
#    print("error, Código do status:", response.status_code)



#----------------------------------
#for movies in data ["results"]:
#            
#            print(f"Titulo: {movies["title"]}")
#            print(f"Sequência: {movies["episode_id"]}")
#            print("-" * 30)