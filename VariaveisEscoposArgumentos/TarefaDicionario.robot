*** Settings ***
Documentation   Exercicio/tarefa Dicionario

*** Variable ***
&{MESES}    Janeiro=31    Fevereiro=28    Março=31    Abril=30    Maio=31    Junho=30     Julho=31    Agosto=31    Setembro=30    Outubro=31    Novembro=30    Dezembro=31

*** Test Cases ***
Caso de teste 01
    Mostrar o log

*** Keywords ***
Mostrar o log
    Log To Console    ${MESES.Janeiro}    ${MESES.Fevereiro}    ${MESES.Março}    ${MESES.Abril}
    Log To Console    ${MESES.Maio}    ${MESES.Junho}    ${MESES.Julho}    ${MESES.Agosto}
    Log To Console    ${MESES.Setembro}    ${MESES.Outubro}    ${MESES.Novembro}    ${MESES.Dezembro}