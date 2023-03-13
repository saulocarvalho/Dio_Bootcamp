class Conta:
    def __init__(self, n_agencia, saldo):
        self._saldo = saldo
        self.n_agencia = n_agencia
    def depositar (self, valor):
        self._saldo += valor

    def sacar (self, valor):
        self._saldo -= valor

    def mostrar_saldo(self):
        return self._saldo

    def __str__(self):
        return f"{self.__class__.__name__}: {', '.join([f'{chave}={valor}' for chave, valor in self.__dict__.items()])}"

conta = Conta("0002", 100)
conta.depositar(200)
print(conta.mostrar_saldo())