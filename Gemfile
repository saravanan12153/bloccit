source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.1.1'
# Use sqlite3 as the database for Active Record
group :production do
  gem 'pg'
  gem 'rails_12factor'
end

group :development do
  gem 'sqlite3'
  gem 'better_errors'
  gem 'binding_of_caller'
end
# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.3'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'
# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer',  platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0',          group: :doc

# Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
gem 'spring',  group: :development


#boostrap gem
gem 'bootstrap-sass', '~> 3.1.1'

#faker gem to load seed database
gem 'faker'

#devise for user authentication
gem 'devise'

#figaro
gem 'figaro'

#authorize user for diff tasks
gem 'pundit'

#forms for html
#gem 'simple_form'

#allows for markdown in posts
gem 'redcarpet'

#this will allow users to upload images and manipulate them
gem 'carrierwave'
gem 'mini_magick'

#fog is a cloud services library using S3 
gem 'fog'

#allows for pages to be created
gem 'will_paginate', '~> 3.0.5'

#install rspec

group :test do
	gem 'rspec-rails', '~> 3.0.0'
	gem 'capybara'
	gem 'database_cleaner'
	gem 'factory_girl_rails','~> 4.0'
end

