*** Settings ***
Documentation   TarefaArgumentos
Library         String

*** Variable ***
&{PESSOA}     nome=Evandro    sobrenome=Dias
${DOMINIO}    @testerobot.com.br
${EMAIL_CRIADO}     emailgerado
*** Test Cases ***
Caso de teste de exemplo 01
    Essa keyword gera palavra aleatoria


*** Keywords ***
Essa keyword gera palavra aleatoria    
    # ${result} =    Replace String    Robot Framework    Frame    Class
    # Should be equal    ${result}    Robot Classwork
    ${PALAVRA_ALEATORIA}    Generate Random String    ${8}
    ${EMAIL_CRIADO}    Replace String    ${PESSOA.nome}${PESSOA.sobrenome}${PALAVRA_ALEATORIA}${DOMINIO}    Frame    Class
    Subkeyword de log    ${EMAIL_CRIADO}

Subkeyword de log
    [Arguments]    ${EMAIL_CRIADO}
    Log To Console    Email criado será ${EMAIL_CRIADO}