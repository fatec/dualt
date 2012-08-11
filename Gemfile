source 'https://rubygems.org'
gem 'rails', '3.2.6'
gem 'sqlite3'
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
end
gem 'jquery-rails'
#gem "rspec-rails", ">= 2.10.1", :group => [:development, :test]
#gem "factory_girl_rails", ">= 3.3.0", :group => [:development, :test]
#gem "capybara", ">= 1.1.2", :group => :test
#gem "database_cleaner", ">= 0.8.0", :group => :test
#gem "launchy", ">= 2.1.0", :group => :test
gem "devise", ">= 2.1.0"
gem "cancan", ">= 1.6.7"
gem "rolify"
gem 'bootstrap-sass', '~> 2.0.4.0'
gem "simple_form"
gem "rails-footnotes", ">= 3.7", :group => :development
gem "therubyracer", :group => :assets, :platform => :ruby

group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'guard-rspec'
end

group :test do
  gem 'faker'
  gem 'capybara'
  gem 'guard-rspec'
  gem 'launchy'
  gem 'database_cleaner'
  gem "email_spec", ">= 1.2.1", :group => :test
  gem "cucumber-rails", ">= 1.3.0", :group => :test, :require => false
end