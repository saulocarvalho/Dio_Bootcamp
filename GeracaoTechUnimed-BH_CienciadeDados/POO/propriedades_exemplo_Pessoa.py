class Pessoa:
    def __init__(self, nome, ano_nascimento):
        self._nome = nome
        self._ano_nascimento = ano_nascimento


    @property
    def nome(self):
        return self._nome
    
    @property
    def idade(self):
        _ano_atual = 2023
        return _ano_atual - self._ano_nascimento
           
    def __str__(self):
        return f"{self.__class__.__name__}: {', '.join([f'{chave}={valor}' for chave, valor in self.__dict__.items()])}"
    
pessoa = Pessoa("Saulo", 2000)
print(pessoa)
print(pessoa.idade)