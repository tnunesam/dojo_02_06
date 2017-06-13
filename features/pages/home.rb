require 'capybara/rspec'
require 'capybara/cucumber'
require 'capybara'
require 'rspec'
require 'cucumber'
require 'selenium-webdriver'
require 'site_prism'
require 'pry'

class Home < SitePrism::Page
	set_url "https://demo.suiteondemand.com/index.php?module=Users&action=Login"
	element :field_subject ,:id , 'name'
	element :field_start_date ,:id , 'date_start_date'
	element :select_status ,:id , 'status'
	element :select_type ,:id , 'parent_type'
	element :field_contact_name ,:id , 'contact_name'
	element :select_priority ,:id , 'priority'
	element :field_description ,:id , 'description'
	element :field_parent_name, :id , 'parent_name'
	element :field_busca, :id , 'query_string'
	element :button_actions, :id , 'tab-actions'
	element :button_edit, :id , 'edit_button'
	element :grid_resultado, :xpath , '//*[@class="list View"]'
	element :button_minimizar_recentes, :id , 'buttontoggle'
	element :button_delete_task, :id , 'delete_button'


	def selecionar_opcao_create()
		find('#quickcreatetop').hover
		click_link('Create Task')
	end


	def preencher_campos_task(subject,priority,description,contact_name,type,status,data)
		field_subject.set(subject)
		field_start_date.set(data)
		select_status.select (status)
		select_type.select(type)
		field_contact_name.set(contact_name)
		select_priority.select(priority)
		field_description.set(description)
		field_parent_name.set('Teste Parent Name')
	end

	def busca(subject)
		field_busca.set(subject)
		find(:xpath, '//*[@class="btn btn-default"]').click
	end

	

	def clicar_botao_save
		botao = all(:xpath, '//*[@class="button primary"]')
		page.execute_script "window.scrollBy(0,300)"
		botao[1].click
	end
end