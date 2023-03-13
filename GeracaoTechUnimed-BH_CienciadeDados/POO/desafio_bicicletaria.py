class Bicicleta:
    def __init__(self, cor, modelo, ano, valor):
        self.cor = cor
        self.modelo = modelo
        self.ano = ano
        self.valor = valor
        #self.aro = 18
        #self.marcha = 1

    def buzinar(self):
        print("Buzinando")

    def parar(self):
        print("Bicicleta parada")

    def correr(self):
        print("Bicicleta correndo")
    
   # def trocar_marcha(self, nro_marcha):
    #    print("Trocando marcha")

    #    def _trocar_marcha():
    #       if nro_marcha > self.marcha:
    #           print("Marcha trocada")
    #       else:
    #           print("Não foi possível trocar a marcha")
    #def __str__(self):
    #     return f"Bicicleta: cor= {self.cor}, modelo= {self.modelo}, ano= {self.ano}, valor= {self.valor}"
    def __str__(self):
        return f"{self.__class__.__name__}: {', '.join([f'{chave}={valor}' for chave, valor in self.__dict__.items()])}"


b1 = Bicicleta("vermelha", "caloi", 2022, 600)
b1.parar()
b1.buzinar()
b1.correr()
print(b1.cor, b1.ano, b1.modelo, b1.valor)

b2 = Bicicleta("Verde", "Mornark", 2023, 750)
b2.buzinar() # = Bicicleta.buzinar (b2)
#print(b2.what_color())
print(b2.cor)
print(b2)