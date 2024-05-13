capacidade_atual, aumento_percentual = map(int, input().split())

porcentagem = aumento_percentual / 100
aumento = capacidade_atual * porcentagem
aumento = aumento + capacidade_atual
#aumento = (capacidade_atual * aumento_percentual) / 100
#nova_capacidade = capacidade_atual + aumento
print(int(aumento))