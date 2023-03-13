class Animal:
    def __init__(self, n_patas):
        self.n_patas = n_patas

    def __str__(self):
        return f"{self.__class__.__name__}: {', '.join([f'{chave}={valor}' for chave, valor in self.__dict__.items()])}"
    
class Mamifero (Animal):
    def __init__(self, cor_pelo, **kw):
        self.cor_pelo = cor_pelo
        super().__init__(**kw)

class Ave (Animal):
    def __init__(self, cor_bico, **kw):
       self.cor_bico = cor_bico
       super().__init__(**kw)


class Gato (Mamifero):
    pass

class Ornitorrinco (Mamifero, Ave):
    def __init__(self, cor_pelo, **kw):
        super().__init__(cor_pelo, **kw)

gato = Gato(n_patas = 4, cor_pelo= "Branco")
print(gato)
#Declaração agora nomeada devido ao uso do **kw
Orn = Ornitorrinco(n_patas = 4, cor_pelo = "Verde", cor_bico = "Laranja")
print(Orn)