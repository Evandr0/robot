*** Settings ***
Documentation   Exercicio/tarefa Lista

*** Variable ***
@{MESES}    Janeiro    Fevereiro    Março    Abril    Maio    Junho     Julho    Agosto    Setembro    Outubro    Novembro    Dezembro

*** Test Cases ***
Caso de teste 01
    keyword 01

*** Keywords ***
keyword 01    
    Log    ${MESES[0]} ${MESES[1]} ${MESES[2]} ${MESES[3]} ${MESES[4]} ${MESES[5]} ${MESES[6]} ${MESES[7]} ${MESES[8]} ${MESES[9]} ${MESES[10]} ${MESES[11]}


