*** Settings ***
Library  String

*** Variables ***
&{PESSOA}  nome=marcos    sobrenome=lima

*** Test Cases ***
Caso de Teste 01 - Criando um e-mail customizado
    ${EMAIL_ALEATORIO}    Deve gerar um e-mail customizado    ${PESSOA.nome}    ${PESSOA.sobrenome}
    Log To Console     ${EMAIL_ALEATORIO}

*** Keywords ***
Deve gerar um e-mail customizado
    [Arguments]    ${PESSOA.nome}    ${PESSOA.sobrenome}
    ${PALAVRA_ALEATORIA}    Generate Random String
    ${EMAIL_GERADO}    Set Variable    ${PESSOA.nome}${PESSOA.sobrenome}${PALAVRA_ALEATORIA}@teste.com
    [Return]    ${EMAIL_GERADO}
    Log To Console    ${EMAIL_GERADO}