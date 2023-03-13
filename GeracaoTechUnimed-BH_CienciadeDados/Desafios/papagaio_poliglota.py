

#posicao = input().lower()

#if posicao == 'esquerda':
#    print("ingles")
#if posicao == 'direita':
#    print("frances")
#if posicao == 'nenhuma':
#    print("portugues")
#if posicao == 'ambas':
#    print("caiu")


while True: 
    try: 
        posicao = input().lower()
        if posicao == 'esquerda':
            print("ingles")
            #break
        elif posicao == 'direita':
            print("frances")
            #break
        elif posicao == 'nenhuma':
            print("portugues")
            #break
        elif posicao == 'ambas':
            print("caiu")
           
        else:
            break
           # TODO:  Programe aqui dentro as condições necessárias para satisfazer o problema
           # e imprima a saída de acordo com a situação das pernas do papagaio
    except EOFError: 
        break

