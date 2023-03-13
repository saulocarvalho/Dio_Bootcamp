from abc import ABC, abstractmethod, abstractproperty

class ControleRemoto(ABC):
    @abstractmethod #Obriga a classe filha a implementar os metodos
    def ligar(self):
        pass
    
    @abstractmethod
    def desligar(self):
        pass

    @property
    @abstractproperty
    def marca(self):
        pass

class ControleTv(ControleRemoto):
    def ligar(self):
        print("ligando Tv")
    
    def desligar(self):
        print("Desligando a tv")

    @property
    def marca(self):
        return "Samsung"

class ControleAr(ControleRemoto):
    def ligar(self):
        print("Ligando ar")
    
    def desligar(self):
        print("Desligando o ar")

    @property
    def marca(self):
        return "Midea"

controle = ControleTv()
    
controle.ligar()
controle.desligar()
print(controle.marca)

controle2 = ControleAr()
controle2.ligar()
controle2.desligar()
print(controle2.marca)