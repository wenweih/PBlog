source 'https://ruby.taobao.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
gem 'puma'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.3.13', '< 0.5'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'

# Use jquery as the JavaScript library
gem 'jquery-rails'
# Turbolinks makes following links in your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'

gem 'bourbon'
gem "autoprefixer-rails"

#Generates javascript file that defines all Rails named routes as javascript helpers
gem "js-routes"

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

gem 'settingslogic'
gem "lograge"

gem "haml-rails", "~> 0.9"

gem 'gon'

gem "browser"

gem 'clearance'
gem "administrate", "~> 0.3.0"
#
#
gem 'rails-i18n', '~> 5.0.0' # For 5.0.x
gem 'http_accept_language'
#
gem 'acts-as-taggable-on', '~> 4.0'
gem 'friendly_id', '~> 5.1.0' # Note: You MUST use 5.0.0 or greater for Rails 4.0+

gem 'kaminari'

# gem "html_truncator", "~>0.2"

gem "rails_best_practices"

#cache
gem 'redis', '~>3.2' #A Ruby client library for Redis
gem 'redis-namespace' #This gem adds a Redis::Namespace class which can be used to namespace Redis keys.
gem 'redis-rails' #Redis stores for Rack::Cache
gem 'redis-objects' #将一些数据放入 Redis

gem 'rails_emoji_picker'

gem 'aasm'

gem 'sidekiq'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# sendclound mail
gem 'sendcloud_rails', '~> 0.0.1'

# mail
gem 'mailgun_rails'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'rspec-rails', '~> 3.5'
  gem 'factory_girl_rails'
  gem 'shoulda-matchers', '~> 3.1'
  gem 'faker'
end

group :development do
  #To annotate just your models:   annotate --exclude tests,fixtures,factories,serializers
  gem 'annotate' #Annotate Rails classes with schema and routes info
  gem "letter_opener"
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

group :test do
  gem 'database_cleaner'
end
