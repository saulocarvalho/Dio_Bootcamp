import textwrap


def menu():
    menu = """

    [d] Depositar
    [s] Sacar
    [e] Extrato
    [nc] Nova conta
    [lc] Listar contas
    [nu] Novo usuário
    [q] Sair

    => """
    return input(textwrap.dedent(menu))

def depositar(saldo, valor, extrato, /):
    if valor > 0:
               saldo += valor
               extrato += f"Depósito: R$ {valor:.2f}\n"
        
    else:
               print ("Operação Falhou! O valor informado é inválido.")
    return saldo, extrato

def sacar(*, saldo, valor, extrato, limite, numero_saques, limite_saques):
            excedeu_saldo = valor > saldo

            excedeu_limite = valor > limite

            excedeu_saques = numero_saques >= limite_saques

            if excedeu_saldo:
              print("Operação falhou! Você não tem saldo suficiente.")
        
            elif excedeu_limite:
              print("Operação Falhou! O valor do saque excede o limite.")

            elif excedeu_saques:
              print("Operação Falhou! Número máximo de saques excedido.")

            elif valor > 0:
              saldo -= valor
              extrato += f"Saque: R$ {valor:.2f}\n"
              numero_saques += 1
              print("Saque realizado com sucesso")    
            else:
             print("Operação falhou! O valor informado é inválido.")

             return saldo, extrato

def exibir_extrato(saldo, /, *, extrato):
            print ('---------Extrato---------')
            print("Não foram realizadas movimentações." if not extrato else extrato)
            print(f"\nSaldo: R$ {saldo:.2f}")
            print("--------------------------")

def criar_usuario(usuarios):
     cpf = input("informe o CPF (somente números): ")
     usuario = filtrar_usuario(cpf, usuarios)

     if usuario:
          print("Já existe usuário cadastrado com esse CPF")
          return
     nome = input("Informe o nome completo: ")
     data_nascimento = input("Informe a data de nascimento (dd-mm-aaaa): ")
     endereco = input ("Informe o endereço (logradouro, nro - bairro - cidade/sigla Estado): ")

     usuarios.append({"nome": nome, "data_nascimento": data_nascimento, "cpf": cpf, "endereco": endereco})

     print("Usuário cadastrado com sucesso")

def filtrar_usuario(cpf, usuarios):
     usuarios_filtrados = [usuario for usuario in usuarios if usuario["cpf"] == cpf]
     return usuarios_filtrados[0] if usuarios_filtrados else None

def main():
    AGENCIA = "0001"
    saldo = 0
    limite = 500
    extrato = ""
    numero_saques = 0
    LIMITE_SAQUES = 3
    usuarios = []
    contas = []

    while True:
        opcao = menu()

        if opcao == 'd':
           valor = float(input("informe o valor a ser depositado\n"))
           saldo, extrato = depositar (saldo, valor, extrato)
        

        elif opcao == 's':
            valor = float(input("Informe o valor de saque: "))

            saldo, extrato=sacar(
            saldo=saldo,
            valor=valor,
            extrato=extrato,
            limite=limite,
            numero_saques=numero_saques,
            limite_saques=LIMITE_SAQUES,
        )
            
        elif opcao == 'e':
            exibir_extrato(saldo, extrato=extrato)
        

        elif opcao == 'nu':
            criar_usuario(usuarios)

        elif opcao == 'nc':
            numero_conta - len(contas) +1

        elif opcao == 'q':
              break

        else:
            print ("Operação inválida, por favor selecione novamente a operação desejada.")


main()