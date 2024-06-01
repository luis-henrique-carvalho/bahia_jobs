source 'https://rubygems.org'

ruby '3.2.0'

gem 'active_model_serializers'
gem 'bcrypt', '~> 3.1.7'
gem 'bootsnap', require: false
gem 'bootstrap'
gem 'devise', '~> 4.9'
gem 'figaro'
gem 'font-awesome-sass'
gem 'i18n'
gem 'image_processing', '~> 1.2'
gem 'importmap-rails'
gem 'jbuilder'
gem 'kredis'
gem 'pg', '~> 1.1'
gem 'puma', '>= 5.0'
gem 'pundit', '~> 2.3'
gem 'rails', '~> 7.1.3', '>= 7.1.3.3'
gem 'ransack'
gem 'redis', '>= 4.0.1'
gem 'rubocop'
gem 'sassc-rails'
gem 'simple_form'
gem 'sprockets-rails'
gem 'stimulus-rails'
gem 'turbo-rails'
gem 'tzinfo-data', platforms: %i[windows jruby]

group :development, :test do
  gem 'annotate'
  gem 'awesome_print'
  gem 'debug', platforms: %i[mri mswin mswin64 mingw x64_mingw]
  gem 'faker'
  gem "factory_bot_rails"
  gem 'rails-erd'
  gem 'rspec-rails'
end

group :development do
  gem 'mailcatcher'
  gem 'rack-mini-profiler'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console'
end

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem 'capybara'
  gem 'selenium-webdriver'
end

gem "database_cleaner-active_record", "~> 2.1", :group => :test

gem "simplecov", "~> 0.22.0", :group => :test, :require => false

gem "simplecov_json_formatter", "~> 0.1.4", :group => :test, :require => false

gem "shoulda-matchers", "~> 6.2", :group => :test
