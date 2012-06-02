require 'cucumber/rails'

Dir[Rails.root.join("spec/factories/**/*.rb")].each {|f| require f}

Capybara.configure do |config|
 config.default_driver = :webkit
 config.javascript_driver = :webkit
end

ActionController::Base.allow_rescue = false

begin
  DatabaseCleaner.strategy = :truncation
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end

Cucumber::Rails::Database.javascript_strategy = :truncation

