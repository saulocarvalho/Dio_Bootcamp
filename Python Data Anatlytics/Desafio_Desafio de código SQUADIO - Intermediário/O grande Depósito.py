valor = float(input())

if valor > 0:
    print("Deposito realizado com sucesso! \n" f"Saldo atual: R$ {valor:.2f}")
    
elif valor < 0:
   print("Valor invalido! Digite um valor maior que zero.")
else:
   print("Encerrando o programa...")