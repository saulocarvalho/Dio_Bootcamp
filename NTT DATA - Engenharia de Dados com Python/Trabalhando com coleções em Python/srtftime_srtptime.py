from datetime import datetime

data_hora_atual = datetime.now()
data_hora_str = "2024-08-20 10:00"
mascara_ptbr = "%d/%m/%y %a"
mascara_en = "%Y-%m-%d %H:%M"

print(data_hora_atual.strftime(mascara_ptbr))


print(datetime.strptime(data_hora_str, mascara_en))

