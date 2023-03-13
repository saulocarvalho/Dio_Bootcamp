class Pessoa:
    def __init__(self, nome=None, idade=None):
        self.nome = nome 
        self.idade = idade
    
    @classmethod
    def criar_a_partir_data_nasc(cls, ano, mes, dia, nome):
        idade = 2023 - ano
        return cls(nome, idade)
    
    @staticmethod
    def maior_idade(idade):
        return idade >= 18

#p = Pessoa ("Saulo", 23)
#print(p.nome, p.idade)

p2 = Pessoa.criar_a_partir_data_nasc(2000,3,1,"saulo")
print(p2.nome, p2.idade)

print(Pessoa.maior_idade(23))
print(Pessoa.maior_idade(17))