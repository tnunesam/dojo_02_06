require 'capybara/rspec'
require 'capybara/cucumber'
require 'capybara'
require 'rspec'
require 'cucumber'
require 'selenium-webdriver'
require 'site_prism'
require 'pry'

class Login < SitePrism::Page
	set_url "https://demo.suiteondemand.com/index.php?module=Users&action=Login"
	element :field_username, '#user_name'
	element :field_password, '#user_password'
	element :button_login, '#bigbutton'

	def preencher_usuario_senha(username, password)
		field_username.set username
		field_password.set password
	end

	def clicar_botao_login
		button_login.click
	end
end