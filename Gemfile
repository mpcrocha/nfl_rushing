# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'
gem 'active_model_serializers', require: true

gem 'rails', '~> 6.0.1'

gem 'pg', '>= 0.18', '< 2.0'

gem 'bootsnap', '>= 1.4.2', require: false
gem 'puma', '~> 4.1'

gem 'data_migrate'
gem 'factory_bot_rails'
gem 'rack-cors'
gem 'rspec-rails'
gem 'rubocop'
gem 'will_paginate'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'sqlite3'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
