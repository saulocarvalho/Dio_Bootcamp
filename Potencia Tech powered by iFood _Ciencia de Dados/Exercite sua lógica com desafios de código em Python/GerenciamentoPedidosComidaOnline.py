def main():
    n = int(input())
 
    total = 0
 
    for i in range(1, n + 1):
        pedido = input().split(" ")
        nome = pedido[0]
        valor = float(pedido[1])
        total += valor

    cupomDesconto = input()

    if cupomDesconto == '10%':
        desconto = 0.1
    elif cupomDesconto == '20%':
        desconto = 0.2

    valorFinal = total - (total * desconto)
    print(f'Valor total: {valorFinal:.2f}')
 

 
 
if __name__ == "__main__":
    main()