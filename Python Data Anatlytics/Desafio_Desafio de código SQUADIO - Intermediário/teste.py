senha = input()


#if any(char.isdigit() for char in senha):
#    print ("Tem numero")
#else:
#    print ("Não tem numero")

if senha.lower() in senha:
    print(f"Min {senha}")
else: print(f"maiii {senha}")