require 'rspec'
require 'cucumber'
require 'selenium-webdriver'
require 'capybara'
require 'capybara/cucumber'
require 'rspec/autorun'
require 'capybara/rspec'
require 'pry'
require 'site_prism'

RSpec.configure do |config|
  config.include Capybara::DSL, :type => :request
end


Capybara.register_driver :selenium do |app|
	caps = Selenium::WebDriver::Remote::Capabilities.chrome("chromeOptions" => {"args" => [ "start-maximized" ]})
	  		Capybara::Selenium::Driver.new(app, {:browser => :chrome, :desired_capabilities => caps})
end

Capybara.default_driver = :selenium
Capybara.default_max_wait_time = 10