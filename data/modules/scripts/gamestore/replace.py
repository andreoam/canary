import re

# Nome do arquivo a ser modificado
file_name = "gamestore.lua"

# Leitura do conteúdo do arquivo
with open(file_name, "r") as file:
    content = file.read()

# Função para reduzir o preço pela metade
def reduzir_preco(match):
    preco_atual = int(match.group(1))
    preco_reduzido = preco_atual // 2
    return f"price = {preco_reduzido}"

# Expressão regular para encontrar os preços e aplicar a função
conteudo_modificado = re.sub(r"price\s*=\s*(\d+)", reduzir_preco, content)

# Escrevendo o conteúdo modificado de volta ao arquivo
with open(file_name, "w") as file:
    file.write(conteudo_modificado)

print("Preços reduzidos pela metade com sucesso!")
