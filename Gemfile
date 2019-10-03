source 'https://rubygems.org'

ruby '2.4.5'

gem 'rails', '~> 4.2', '>= 4.2.11.1'
# gem 'mysql2', '>= 0.3.13', '< 0.5'
gem 'mysql2', '>= 0.4.4', '< 0.6.0'
gem 'sassc-rails', '~> 2.1', '>= 2.1.2'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'

gem 'jquery-rails'
gem 'jquery-turbolinks'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'therubyracer'

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'autonumeric-rails'
gem 'bootstrap-sass'
gem 'carrierwave'
gem 'counter_culture', '~> 2.2', '>= 2.2.3'
gem 'chart-js-rails'
# gem 'credit_card_validator'
gem 'devise'
gem 'devise-i18n'
gem 'devise-i18n-views'
gem 'dotenv-rails'
gem 'gmaps4rails'
gem 'gon'
gem 'kakurenbo-puti'
gem 'kaminari'
gem 'less-rails'
gem 'mini_magick'
gem 'momentjs-rails'
gem 'omniauth'
gem 'omniauth-facebook'
gem 'omniauth-google-oauth2'
gem 'payjp'
gem 'rails-i18n'
gem 'ransack'
gem 'seed-fu'
gem 'squasher'
gem 'trix-rails', '~> 0.11.4.1', require: 'trix'
gem 'whenever', require: false

group :test do
  gem 'capybara', '~> 3.28'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers',
    git: 'https://github.com/thoughtbot/shoulda-matchers.git',
    branch: 'rails-5'
  gem 'launchy', '~> 2.4', '>= 2.4.3'
  gem 'vcr'
  gem 'webmock'
  gem 'webdrivers', '~> 4.1', '>= 4.1.2'
end

group :development, :test do
  gem 'annotate'
  gem 'hirb'
  gem 'hirb-unicode'
  gem 'pry-byebug'
  gem 'pry-doc'
  gem 'pry-rails'
  gem 'pry-stack_explorer'
  gem 'rspec-rails', '~> 3.6.0'
  gem 'factory_bot_rails'
end

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'bullet'
  gem 'faker', require: false # for sample data in development
  gem 'guard-livereload', require: false
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'letter_opener_web'
  gem 'web-console', '~> 2.0'
  gem 'rb-readline'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-commands-rspec'
  gem 'view_source_map'
end

group :production do
  gem 'rails_12factor'
  gem 'unicorn'
end
