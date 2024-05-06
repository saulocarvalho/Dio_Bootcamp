def verificar_forca_senha(senha):


  comprimento_minimo = 8
  tem_letra_maiuscula = False
  tem_letra_minuscula = False
  tem_numero = False
  tem_caractere_especial = False

  # Verificando o comprimento da senha
  if len(senha) < comprimento_minimo:
    return f"Sua senha e muito curta. Recomenda-se no minimo {comprimento_minimo} caracteres."

  # Verificando se a senha contém letras maiúsculas  
  if any(x.isupper() for x in senha):
    tem_letra_maiuscula = True

  # Verificando se a senha contém letras minúsculas
  if not senha.lower() in senha:
    tem_letra_minuscula = True
    
  # Verificando se a senha contém sequências comuns
  sequencias_comuns = ["123456", "abcdef"]
  for sequencia in sequencias_comuns:
    if sequencia in senha:
      return "Sua senha contem uma sequencia comum. Tente uma senha mais complexa."

  # Verificando se a senha contém palavras comuns
  palavras_comuns = ["password", "123456", "qwerty"]
  if senha in palavras_comuns:
    return "Sua senha e muito comum. Tente uma senha mais complexa."

  # TODO: Verificar o comprimento mínimo e critérios de validação
  # Verificando se a senha contém caractere especial
  check = ["!", "@", "$", "%", "¨", "&", "*", "(", ")", "-", "_", "+", "="]
  for especial in check:  
    if especial in senha:
      tem_caractere_especial = True
      
  # Checando se a senha contém número
  if any(char.isdigit() for char in senha):
    tem_numero = True
    

  return 'Sua senha atende aos requisitos de seguranca. Parabens!' if tem_letra_maiuscula and tem_letra_minuscula and tem_numero and tem_caractere_especial else 'Sua senha nao atende aos requisitos de seguranca.'


# Obtendo a senha do usuário
senha = input().strip()

# Verificando a força da senha
resultado = verificar_forca_senha(senha)

# Imprimindo o resultado
print(resultado)