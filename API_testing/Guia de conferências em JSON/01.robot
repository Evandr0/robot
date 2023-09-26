# 01 - Conferindo atributos do JSON (chave=valor):
# Para conferir atributos, que são valores entre {}, use as keywords Dictionary Should ...

# Exemplos:

Dictionary Should Contain Key     ${RESPOSTA.json()}            info
Dictionary Should Contain Item    ${RESPOSTA.json()["info"]}    version        1.0.0
Dictionary Should Cont


# 02 - Conferindo arrays do JSON (listas []):
# Para conferir arrays dentro de JSONs, que são valores entre [], use as keywords List Should ..., lembrando-se que é necessário passar o índice do item na lista, ou utilizar FOR IN para percorrer a lista e passar item a item dessa lista!

# Exemplos:

List Should Contain Value     ${RESPOSTA.json()["info"]["alias"][1]}   server1
List Should Contain Value     ${RESPOSTA.json()["info"]["alias"][2]}   server2
List Should Contain Value     ${RESPOSTA.json()["info"]["alias"][3]}   server3
 
 
List Should Contain Value     ${RESPOSTA.json()["secrets"][1]["name"]}  Secret Alpha
ou
Dictionary Should Contain Item    ${RESPOSTA.json()["secrets"][1]}   name   Secret Alpha


# 03 - Percorrendo listas de JSON com o FOR IN:
# O código abaixo irá percorrer a lista de secrets do JSON de exemplo, imprimindo cada name e id dos 3 objetos da lista!

# Exemplo:

FOR   ${secret}   IN   @{RESPOSTA.json()["secrets"]}
    Log   ${secret}  # Nessa linha irá imprimir o objeto inteiro
    Log   ${secret["name"]} # Nessa linha irá imprimir o valor "name" do objeto
    Log   ${secret["id"]} # Nessa linha irá imprimir o valor "id" do objeto
END