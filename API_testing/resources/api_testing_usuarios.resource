*** Settings ***
Library  RequestsLibrary
Library  String
Library  Collections

*** Variables ***
${EMAIL_TESTE} 
${ID_USUARIO}
${resposta} 
${RESP_CONSULTA} 
${RESP_LOGIN} 

*** Keywords ***
Criar um usuário novo
    ${palavra_aleatoria}    Generate Random String   length=4   chars=[LETTERS]
    ${palavra_aleatoria}    Convert To Lower Case    ${palavra_aleatoria}
    Set Test Variable   ${EMAIL_TESTE}    ${palavra_aleatoria}@emailteste.com
    Log    ${EMAIL_TESTE}
    Log    palavra aleatorio é: ${palavra_aleatoria}@emailteste.com

Cadastrar o usuário criado na ServeRest
    [Arguments]    ${email}    ${status_code_desejado}
    ${body}    Create Dictionary    
    ...        nome=Fulano da Silva    
    ...        email=${EMAIL_TESTE}    
    ...        password=1234    
    ...        administrador=true
    Log        ${body}    
    Criar sessão na serverRest
    ${resposta}    POST On Session    
    ...    alias=ServerRest
    ...    url=/usuarios
    ...    json=${body}
    ...    expected_status=${status_code_desejado}
    Log    ${resposta.json()}
    Log    ${resposta}
    
    IF     ${resposta.status_code} == 201
         Set Test Variable    ${ID_USUARIO}    ${resposta.json()["_id"]}
    END  

    Set Test Variable    ${resposta}    ${resposta.json()}

Criar sessão na serverRest
    ${header}  Create Dictionary
    ...       Content-Type=application/json
    ...       accept=application/json
    Create Session    alias=ServerRest    url=https://serverest.dev   headers=${header}

Conferir se o usuário foi cadastrado corretamente
    Log    ${resposta}
    Dictionary Should Contain Item    ${resposta}    message    Cadastro realizado com sucesso
    Dictionary Should Contain Key     ${resposta}    _id

Vou repetir o cadastro do usuário
    Cadastrar o usuário criado na ServeRest    ${EMAIL_TESTE}   status_code_desejado=400
    
Verificar se a API não permitiu o cadastro repetido
    Dictionary Should Contain Item    ${resposta}    message    Este email já está sendo usado

Consultar os dados do novo usuário
    ${resposta_consulta}    GET On Session    alias=ServerRest    url=/usuarios/${ID_USUARIO}
    Set Test Variable    ${RESP_CONSULTA}    ${resposta_consulta.json()}

Conferir os dados retornados
    Log    ${RESP_CONSULTA}
    Dictionary Should Contain Item    ${RESP_CONSULTA}    nome             Fulano da Silva
    Dictionary Should Contain Item    ${RESP_CONSULTA}    email            ${EMAIL_TESTE}
    Dictionary Should Contain Item    ${RESP_CONSULTA}    password         1234
    Dictionary Should Contain Item    ${RESP_CONSULTA}    administrador    true
    Dictionary Should Contain Item    ${RESP_CONSULTA}    _id              ${ID_USUARIO}

Realizar Login com o usuário
    Criar sessão na serverRest
    ${body_login}    Create Dictionary    email=${EMAIL_TESTE}    password=1234
    ${resposta_login}    POST On Session    
    ...    alias=ServerRest
    ...    url=/login
    ...    json=${body_login}
    Set Test Variable    ${RESP_LOGIN}     ${resposta_login.json()}
    Log    ${resposta_login.json()}
    Log    ${resposta_login}

Conferir se o Login ocorreu com sucesso
    Log    ${RESP_LOGIN}
    Dictionary Should Contain Item    ${RESP_LOGIN}    message            Login realizado com sucesso
    Dictionary Should Contain Key     ${RESP_LOGIN}    authorization