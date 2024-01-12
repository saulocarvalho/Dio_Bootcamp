numPedidos = int(input())

for i in range(1, numPedidos + 1):
    prato = input()
    calorias = int(input())
    ehVegano = False
    ehVegano=input()
    if ehVegano =='s':
        ehVegano='Vegano'

    elif ehVegano=='n':
        ehVegano=('Nao-vegano')
    print(f'Pedido {i}: {prato} ({ehVegano}) - {calorias} calorias')