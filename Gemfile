source 'https://rubygems.org'

gem 'rails', '~> 5.0.0.beta3'
gem 'sass-rails'
gem 'uglifier'
gem 'coffee-rails'

gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder'
gem 'sdoc', group: :doc

gem 'materialize-sass'
gem 'fullcontact'
gem 'devise', github: 'plataformatec/devise', branch: 'master'

gem 'faye'
gem 'thin', require: false
gem 'sync'
gem 'figaro'
gem 'better_errors'
gem 'binding_of_caller'
gem 'plissken'

group :development do
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'sqlite3'
  gem 'awesome_print'
  gem 'spring-commands-rspec'
end

group :development, :test do
  gem 'byebug'
  gem 'factory_girl_rails'
  gem 'ffaker'
  gem 'capybara', git: 'git://github.com/jnicklas/capybara.git'
  gem 'launchy'
  gem 'rspec-rails'
  gem 'rubocop'
  gem 'yarjuf'
  gem 'rspec_junit_formatter'
  gem 'pry'
  gem 'binding_of_caller'
end

group :test do
  gem 'guard-rspec'
  gem 'guard-livereload'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'database_cleaner'
  gem 'simplecov', require: false
  gem 'simplecov-csv', require: false
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
  gem 'puma'
end
