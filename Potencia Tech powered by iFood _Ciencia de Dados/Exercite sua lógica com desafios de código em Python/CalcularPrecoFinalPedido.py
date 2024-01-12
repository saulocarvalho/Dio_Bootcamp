valorHamburguer = float(input())
quantidadeHamburguer = int(input())
valorBebida = float(input())
quantidadeBebida = int(input())
valorPago = float(input())

valorTotal = (valorHamburguer * quantidadeHamburguer) + (valorBebida * quantidadeBebida)
troco = valorPago - valorTotal
print(f'O preço final do pedido é R$ {valorTotal:.2f}. Seu troco é R$ {troco:.2f}.')
