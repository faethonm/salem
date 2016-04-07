source 'https://rubygems.org'

gem 'rails', '4.2.4'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'

gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'materialize-sass'
gem 'fullcontact'
gem 'devise'

gem 'faye'
gem 'thin', require: false
gem 'sync'
gem 'figaro'
gem 'rails_12factor'
  
group :development do
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'sqlite3'
  gem 'awesome_print'
  
end

group :development, :test do
  gem 'byebug'
  gem "factory_girl_rails"
  gem 'ffaker'
  gem 'capybara', :git => 'git://github.com/jnicklas/capybara.git'
  gem 'launchy'
  gem "rspec-rails"
  gem 'rubocop'
  gem 'yarjuf'
  gem 'rspec_junit_formatter'
end

group :test do
  gem 'guard-rspec'
  gem 'guard-livereload'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'database_cleaner'
  gem 'simplecov', :require => false
  gem 'simplecov-csv', :require => false
end

group :production do
  gem 'pg'
end
