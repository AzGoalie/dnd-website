source 'https://rubygems.org'

ruby '2.1.5'

gem 'rails', '4.2.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc

# Layout gems
gem 'bootstrap-sass'
gem 'jquery-turbolinks'
gem 'simple_form'
gem 'will_paginate'
gem 'will_paginate-bootstrap'
gem 'best_in_place'
gem 'responders'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'sqlite3'

  gem 'faker'
end

group :test do
	gem 'minitest-reporters'
	gem 'mini_backtrace'
	gem 'guard'
	gem 'guard-minitest'
end

# Heroku gems
group :production do
	gem 'pg'
	gem 'rails_12factor'
  gem 'puma'
end