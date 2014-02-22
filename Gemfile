source 'https://rubygems.org'

ruby '2.0.0'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.1'

gem 'bootstrap-sass', '2.3.2.0'
gem 'will_paginate', '3.0.4'
gem 'bootstrap-will_paginate', '0.0.9'

gem 'jquery-rails', '2.2.1'
gem 'turbolinks', '1.1.1'
gem 'sass-rails', '~> 4.0.0'
gem 'uglifier', '2.1.1'
gem 'coffee-rails', '~>4.0.0'
gem 'simple_form'
gem 'better_errors'
#Create fake users for development and testing purposes
gem 'faker', '1.1.2'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '1.0.2'

# Uncomment this line on OS X.
gem 'growl', '1.0.3'

# Use postgresql as the database for Active Record
gem 'pg'
gem 'devise'

#Attach pictures
gem 'paperclip', '~> 3.0'
#Amazon store's all pictures
gem 'aws-sdk'

group :development do
  gem 'sqlite3'
  #View all table contents in the model
  gem 'annotate'
  gem 'pry-rails'
  gem 'pry'
end

group :development, :test do
	gem 'rspec-rails', '2.13.1'
	# Run test automatically with guard
	gem 'guard-rspec', '2.5.0'
	# Speed tests with Spork"
	gem 'spork-rails', github: 'sporkrb/spork-rails'
  gem 'guard-spork', '1.5.0'
  gem 'childprocess', '0.3.6'
end

group :test do
  gem 'selenium-webdriver', '~> 2.35.1'
  gem 'capybara', '2.1.0'
  gem 'factory_girl_rails', '4.2.1'
end

group :production do
	# enables serving assets in production and setting your logger to standard out
  gem 'rails_12factor', '0.0.2'
end

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end



# Use ActiveModel has_secure_password
gem 'bcrypt-ruby'

# Use unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano', group: :development

# Use debugger
# gem 'debugger', group: [:development, :test]
