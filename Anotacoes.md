robot framework - Curso udemy
keyword-driven => abstrai camada de programação em baixo nivel (forma de escrita)

Testes:
	Web
	Api
	Mobile
	GUI
Estilos
	keyword-driven
	Data-driven (Tabela de dados)
	Gherkin (BDD)
Execução
	Local
	CI/CD
	Docker
--
Arquitetura
	Test Data
	Robot framework
	Test libraries
	test tools
	System under Testes
--
Testes de aceitação (Funcionais e sistema)
interagir com diversos tipos de sistemas
Automatizadores não muito técnicos
Tirar o foco da prog e foca nos testes.
RPA
--

Testes Funcionais de back-end e UI
Times de stacks hibridas
Time com QA iniciando automação
Diferentes tipos de sistema

--
Open source
Documentação
Visual Studio - um plugin
Integrações por listeners(Jira, etc)

--
QArentena 66: Robot Framework, por Mayara R. Fernandes https://www.youtube.com/watch?v=r-Ju-O_miv0

DevTalk - Workshop: Automação de Testes com Robot Framework https://youtu.be/BCPTwXXkxtw
--

5. A abordagem keyword-driven

Exemplo:

keyword
	Open Browser	https://www.facebook.com/ 	firefox
	
6. Pesquisando, escolhendo e entendendo a libs
	robotframework.org
	pypi.org
	
Instalando as libs
	SeleniumLibrary  (WEB) pip install --upgrade robotframework-seleniumlibrary
	RequestsLibrary  (API) pip install robotframework-requests

Instalado extensão visual stio robot fra.. language...
"Instalado" chromedriver e geckodriver. (Baixar o exe e colocar dentro da pasta PATH)

