source 'https://rubygems.org'
gem 'rails', '3.2.8'
#gem 'sqlite3'
gem 'pg'
gem 'jquery-rails'
gem "devise", ">= 2.1.0"
gem "cancan", ">= 1.6.7"
gem "rolify"
gem 'bootstrap-sass', '~> 2.0.4.0'
gem "simple_form"
gem "i18n"

# for deployment
gem 'unicorn'
gem 'capistrano'


group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem "therubyracer", :platform => :ruby
end

group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'guard-rspec'
  gem "rails-footnotes", ">= 3.7"
end

group :test do
  gem 'faker'
  gem 'capybara'
  gem 'guard-rspec'
  gem 'launchy'
  gem 'database_cleaner'
  gem "email_spec", ">= 1.2.1"
  gem "cucumber-rails", ">= 1.3.0", :require => false
end