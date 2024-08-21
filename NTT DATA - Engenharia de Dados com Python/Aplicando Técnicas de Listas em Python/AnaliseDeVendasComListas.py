def analise_vendas(vendas):
    # TODO: Calcule o total de vendas e realize a média mensal:
    total_vendas = sum(conversao)
    media_vendas = total_vendas / len(conversao)
    return f"{total_vendas}, {media_vendas:.2f}"

def obter_entrada_vendas():
    # Solicita a entrada do usuário em uma única linha
    entrada = input()
    # TODO: Converta a entrada em uma lista de inteiros:
    separacao = entrada.split(',')
    conversao = []
    for valores in separacao:
        conversao.append(int(valores))
   
    return conversao

conversao = obter_entrada_vendas()
print(analise_vendas(conversao))




