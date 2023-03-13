class Estudante:
    escola = "DIO"

    def __init__(self,nome, matricula):
        self.nome = nome   
        self.matricula = matricula

    def __str__(self) -> str:
        return f"{self.nome} - {self.matricula} - {self.escola}"
    
def mostrar_valores(*objs):
        for obj in objs:
            print(obj)
aluno_1 = Estudante("Saulo", 1)
aluno_2 = Estudante("Carvalho", 2)

#Variavel de objeto única por instância (self = identificar variável de instância)
#Variavel de classe são únicas para todos os objetos (alterando para todos)
mostrar_valores(aluno_1, aluno_2)


aluno_1.matricula=3

mostrar_valores(aluno_1, aluno_2)

Estudante.escola = "DIO2"

mostrar_valores(aluno_1, aluno_2)

aluno_3 = Estudante ("Dias", 3)

mostrar_valores(aluno_1, aluno_2)