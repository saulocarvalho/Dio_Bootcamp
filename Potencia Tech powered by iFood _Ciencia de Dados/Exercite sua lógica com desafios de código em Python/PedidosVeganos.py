numPedidos = int(input())

for i in range(1, numPedidos + 1):
    prato = input()
    calorias = int(input())
    ehVegano = False

ehVegano=input()
if ehVegano =='s':
    ehVegano=True

print(prato, calorias, ehVegano)