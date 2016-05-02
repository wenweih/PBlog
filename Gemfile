source 'http://gems.ruby-china.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.3.13', '< 0.5'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5.0.0.beta'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc

gem 'bourbon'
gem "autoprefixer-rails"

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
gem 'unicorn'

gem 'settingslogic'

gem "haml-rails", "~> 0.9"

gem 'gon'

gem "browser"

gem 'clearance'
gem "administrate", "~> 0.1.4"

gem "refile", require: "refile/rails"
gem "refile-mini_magick"

gem 'rails-i18n', github: 'svenfuchs/rails-i18n', branch: 'rails-4-x' # For 4.x

gem 'acts-as-taggable-on', '~> 3.4'
gem 'acts_as_votable', '~> 0.10.0'
gem 'acts_as_commentable_with_threading'

gem 'friendly_id', '~> 5.1.0'

gem "html_truncator", "~>0.2"

gem 'annotate' #Annotate Rails classes with schema and routes info

gem "rails_best_practices"

gem 'active_link_to'

#cache
gem 'redis', '~>3.2' #A Ruby client library for Redis
gem 'redis-namespace' #This gem adds a Redis::Namespace class which can be used to namespace Redis keys.
gem 'redis-rails' #Redis stores for Rack::Cache
gem 'redis-objects' #将一些数据放入 Redis

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'quiet_assets'
  # gem 'rack-mini-profiler'
end

group :development do
  gem "letter_opener"
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end
