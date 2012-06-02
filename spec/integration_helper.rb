require File.expand_path(File.dirname(__FILE__) + "/spec_helper")

# Put your acceptance spec helpers inside /spec/acceptance/support
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

require 'capybara/rails'
require 'capybara/rspec'

require 'headless'

headless = Headless.new
headless.start

Capybara.configure do |config|
 config.default_driver = :webkit
 config.javascript_driver = :webkit
end

RSpec.configure do |config|
  config.include Capybara::DSL
  config.use_transactional_fixtures = false

  config.before :each do
    DatabaseCleaner.strategy = :truncation
    DatabaseCleaner.clean
  end
  
end