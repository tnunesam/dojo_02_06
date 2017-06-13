#language: pt
#utf-8

Funcionalidade: Gerenciamento de tasks na suite CRM
Como usuario da suite CRM
Quero editar, deletar e incluir tasks
Para controle e manipulação de tasks

Contexto: Login no site CRM
	Dado que sou usuario da suite CRM
	Quando acesso o site CRM
	E entro com as informações de usuario e senha
	E clico no botão Log In
	Então tela home é apresentada

Esquema do Cenario: Cadastrar nova task
	Quando seleciono a opção Create Task no menu CREATE
	Então é exibida a tela de Criação de tasks
	Quando preencho os campos <Subject> , <Priority> , <Description> , <Contact_Name> , <Related_to> e <Status>
	E clico no botão SAVE
	Então validao as informações <Subject> , <Priority> , <Description> , <Contact_Name> , <Related_to> e <Status> do teste na tela

	Exemplos:
	|Subject				|Priority	|Description							|Contact_Name	|Related_to	|Status			|
	|"Teste 565"			|"High"		|"Teste"								|"Zé Rafael"	|"Account"	|"In Progress"	|
	|"Teste 985"			|"Low"		|"Teste"								|"Zé Rafael"	|"Bug"		|"In Progress"	|

Esquema do Cenario: Editar task existente
	Quando clico no botão lupa
	E digito a task <Subject> e clico no botão lupa
	Então é exibida tela com resultado da busca
	Quando clico na task <Subject> desejada
	Então é exibido registro da task <Subject>
	Quando clico no botão Actions
	E clico no botão Editar
	Então é exibida tela de Edição
	Quando clico no botão SAVE
	Então validao as informações <Subject> , <Priority> , <Description> , <Contact_Name> , <Related_to> e <Status> do teste na tela

	Exemplos:
	|Subject				|Priority	|Description							|Contact_Name	|Related_to	|Status			|
	|"Teste 565"			|"High"		|"Teste"								|"Zé Rafael"	|"Account"	|"In Progress"	|
	|"Teste 985"			|"Low"		|"Teste"								|"Zé Rafael"	|"Bug"		|"In Progress"	|
@Teste
Esquema do Cenario: Deletar task existente
	Quando clico no botão lupa
	E digito a task <Subject> e clico no botão lupa
	Então é exibida tela com resultado da busca
	Quando clico na task <Subject> desejada
	Então é exibido registro da task <Subject>
	Quando clico no botão Actions
	E clico no botão Deletar
	Então registro <Subject> deletado

	Exemplos:
	|Subject				|Priority	|Description							|Contact_Name	|Related_to	|Status			|
	|"Teste 985"			|"Low"		|"Teste"								|"Zé Rafael"	|"Bug"		|"In Progress"	|
