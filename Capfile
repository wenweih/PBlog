# Load DSL and set up stages
require "capistrano/setup"

# Include default deployment tasks
require "capistrano/deploy"

require "capistrano/scm/git"
install_plugin Capistrano::SCM::Git
require "capistrano/setup"

# Include default deployment tasks
require "capistrano/deploy"
require "capistrano-db-tasks"
require "capistrano/rvm"
require "capistrano/bundler"
require "capistrano/rails"
require 'capistrano/rails/migrations'
require 'capistrano/rails/assets'
require "capistrano/sidekiq"
require 'capistrano/puma'
install_plugin Capistrano::Puma, load_hooks: false  # Default puma tasks

# Load custom tasks from `lib/capistrano/tasks` if you have any defined
Dir.glob("lib/capistrano/tasks/*.rake").each { |r| import r }
