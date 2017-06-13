Dado(/^que sou usuario da suite CRM$/) do
	@login = Login.new
  	@home = Home.new
  	@data = Time.now.strftime("%m/%d/%Y")
end

Quando(/^acesso o site CRM$/) do
  	@login.load
end

E(/^entro com as informações de usuario e senha$/) do
  	@login.preencher_usuario_senha('will','will')
end

E(/^clico no botão Log In$/) do
  	@login.clicar_botao_login
end

Então (/^tela home é apresentada$/) do
	assert_text 'SALES'
end

Quando(/^seleciono a opção Create Task no menu CREATE$/) do
  	@home.selecionar_opcao_create()
end

Então(/^é exibida a tela de Criação de tasks$/) do
  	assert_text(' CREATE ')
end

Quando(/^clico no botão SAVE$/) do
  	@home.clicar_botao_save
end


Quando(/^preencho os campos "([^"]*)" , "([^"]*)" , "([^"]*)" , "([^"]*)" , "([^"]*)" e "([^"]*)"$/) do |subject,priority,description,contact_name,type,status|
  	@home.preencher_campos_task(subject,priority,description,contact_name,type,status,@data)
end


Então(/^validao as informações "([^"]*)" , "([^"]*)" , "([^"]*)" , "([^"]*)" , "([^"]*)" e "([^"]*)" do teste na tela$/) do |subject,priority,description,contact_name,type,status|
	binding.pry
	expect(find(:xpath, '//*[@field="name"]').text).to eq(subject)
	expect(find(:xpath, '//*[@field="status"]').text).to eq(status)
	expect(find(:xpath, '//*[@field="date_start"]').text.include?(@data)).to eq(true)
	expect(find(:xpath, '//*[@field="priority"]').text).to eq(priority)
	expect(find(:xpath, '//*[@field="description"]').text).to eq(description)
	expect(find(:xpath, '//*[@class="module-title-text"]').text).to eq(subject.upcase)
end

Quando(/^clico no botão lupa$/) do
	find('#searchbutton').click
end

Quando(/^digito a task "([^"]*)" e clico no botão lupa$/) do |subject|
	@home.busca(subject)
end

Então(/^é exibida tela com resultado da busca$/) do
  	expect(@home.grid_resultado.visible?).to eq(true)
end

Quando(/^clico na task "([^"]*)" desejada$/) do |subject|
  	@home.button_minimizar_recentes.click
	click_link(subject)
end

Então(/^é exibido registro da task "([^"]*)"$/) do |subject|
	binding.pry
  expect(find(:xpath, '//*[@field="name"]').text).to eq(subject)
end

Quando(/^clico no botão Actions$/) do
  @home.button_actions.click
end

Quando(/^clico no botão Editar$/) do
  @home.button_edit.click
end

Então(/^é exibida tela de Edição$/) do
  assert_text "EDIT"
end

E (/^clico no botão Deletar$/) do 
	binding.pry
	@home.button_delete_task.click
	page.driver.browser.switch_to.alert.accept
end

Então (/^registro "([^"]*)" deletado$/) do |subject|
	assert_no_text (subject)
end