from datetime import datetime, timedelta

carro_tipo = 'P' #p,m,g
tempo_pequeno = 30
tempo_medio = 45
tempo_grande = 60
data_atual = datetime.now()

if carro_tipo == 'P':
    data_estimada = data_atual + timedelta(minutes=tempo_pequeno) 
    print(f'O carro chegou em {data_atual} e a estimativa é que fique pronto às {data_estimada}')
elif carro_tipo == 'M':
    data_estimada = data_atual + timedelta(minutes=tempo_medio) 
    print(f'O carro chegou em {data_atual} e a estimativa é que fique pronto às {data_estimada}')
else:
    data_estimada = data_atual + timedelta(minutes=tempo_grande) 
    print(f'O carro chegou em {data_atual} e a estimativa é que fique pronto às {data_estimada}')