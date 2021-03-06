source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.2'
# Use postgresql as the database for Active Record
gem 'pg', '~> 0.18'
# Use Puma as the app server
gem 'puma', '~> 3.0'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Use foundation for styling
gem 'foundation-rails'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Use jquery-ui as a supplement to jquery
gem 'jquery-ui-rails'
# User autocomplete for searching universities
gem 'rails-jquery-autocomplete'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Jquery turbolinks
gem 'jquery-turbolinks'
# Zip-Code Translator
gem 'zip-codes'
# User devise for authorization
gem 'devise'
# Date Validation
gem 'validates_timeliness', '~> 4.0'
gem 'date_validator'
# Use Carrierwave for pictures
gem 'carrierwave', '~> 1.0'
# Cloud hosting and serving of files/pictures
gem 'cloudinary'
# pretty urls
gem 'friendly_id', '~> 5.2'
# admin portal
gem 'rails_admin'
# Use clipboard-rails for clipboard.js integration
gem 'clipboard-rails'
# Use simple-forms for creating Simple-forms
gem 'simple_form'
# Use enum_help for enumerable types in forms
gem 'enum_help'
# Use will paginate for pagination
gem 'will_paginate', '~> 3.1.0'

# For use when deploying to heroku
gem 'rails_12factor', group: :production

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'rspec-rails', '~> 3.5'
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'guard-rspec'
  gem 'spring-commands-rspec'
  gem 'vcr'
  gem 'rails-controller-testing'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem "rails-erd"
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
