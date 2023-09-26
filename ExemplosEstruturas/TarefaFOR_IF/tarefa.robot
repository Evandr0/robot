*** Settings ***
Documentation    Tarefa FOR e IF

*** Variables ***
@{lista}    1    2    3    4    5    6    7    8    9    10

*** Test Case ***
Caso de teste 1
    Percorrendo a lista usando FOR

*** Keywords ***
Percorrendo a lista usando FOR
    FOR    ${numero}    IN    @{lista}
    #Log To Console    O número índice é: '${numero}' com o valor do elemento '${numero}'.
        IF  ${numero} == 5
        Log To Console    Eu sou o número ${numero}
        ELSE IF    ${numero} == 10
        Log To Console    Eu sou o número ${numero}        
        ELSE
        Log To Console    Eu não sou o número 5 e nem o 10!
        END   
    END