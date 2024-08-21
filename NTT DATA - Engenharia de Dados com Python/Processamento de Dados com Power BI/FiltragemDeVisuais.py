
def filtrar_visuais(lista_visuais):
    # Converter a string de entrada em uma lista
    visuais = lista_visuais.split(", ")
    
    # TODO: Normalize e remova duplicatas usando um conjunto
    lista_final = list(map(lambda maiuscula: maiuscula.title(), visuais))
    lista_final = list(set(lista_final))
    # TODO: Converta o conjunto de volta para uma lista ordenada:
    #lista_final = remover_duplicata.sort()
    lista_final.sort()
    # Unir a lista em uma string, separada por vírgulas
    #return(lista_final)
    return ", ".join(lista_final)

# Capturar a entrada do usuário
entrada_usuario = input()

# Processar a entrada e obter a saída
saida = filtrar_visuais(entrada_usuario)
print(saida)