source 'https://rubygems.org'

gem 'rails'
gem 'json'
gem 'jquery-rails'

group :development, :test do
  gem 'sqlite3-ruby', :require => 'sqlite3'
end

group :test do
  gem 'database_cleaner'
  gem 'cucumber-rails', :require => false
  gem 'rspec-rails'
  gem 'jasmine'
end

group :deployment do
  gem 'yun'
end

group :production do
  gem 'pg'
end
