x = input()
conversao = x.split(',')
valores = []
for val in conversao:
    valores.append(int(val))
total_soma = sum(valores)
total_media = total_soma / len(valores)

print(f'{total_soma}, {round(total_media, 2)}')