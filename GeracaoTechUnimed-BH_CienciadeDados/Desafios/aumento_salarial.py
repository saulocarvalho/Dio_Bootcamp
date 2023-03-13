salario = float(input()) 

if (salario < 600.01):
    porcentagem = "17 %"
    reajuste = salario * 0.17 
    novo_salario = salario + reajuste
    

elif (salario > 600) and  (salario < 900.01):
    porcentagem = "13 %"
    reajuste = salario * 0.13
    novo_salario = salario + reajuste
    

elif (salario > 900) and (salario < 1500.01):
    porcentagem = "12 %"
    reajuste = salario * 0.12
    novo_salario = salario + reajuste
    

elif (salario > 1500) and (salario < 2000.01):
    porcentagem = "10 %"
    reajuste = salario * 0.10
    novo_salario = salario + reajuste
    

elif (salario > 2000    ):
    porcentagem = "5 %"    
    reajuste = salario * 0.05
    novo_salario = salario + reajuste
    
else: print ("erro") 

print (f'Novo salario: {novo_salario: .2f}')
print (f"Reajuste ganho: {reajuste: .2f}")
print (f"Em percentual: {porcentagem}")
#print(f'Novo salario: {round(novo_salario,2):.2f}')
#print(f'Reajuste ganho: {round(reajuste,2):.2f}')
#print(f'Em percentual: {porcentagem}')