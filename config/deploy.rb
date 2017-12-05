# config valid for current version and patch releases of Capistrano
lock "~> 3.10.0"

set :application, "MyBlog"
set :repo_url, "git@github.com:wenweih/PBlog.git"

ask :branch, "master"

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, -> do
  if fetch(:stage).to_s == "staging"
    "/home/deploy/projects/#{fetch(:application)}"
  elsif fetch(:stage).to_s == "prerelease"
    "/home/deploy/prerelease/#{fetch(:application)}"
  else
    "/home/deploy/#{fetch(:application)}"
  end
end

set :rails_env, ->{ fetch(:stage) }
set :pty, true

# Default value for :linked_files is []
set :linked_files, fetch(:linked_files, []).push("config/database.yml",
                                                 "config/secrets.yml",
                                                 "config/app.yml")

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push(
  "log",
  "tmp/pids", "tmp/cache", "tmp/sockets", "tmp/files",
  "vendor/bundle",
  "public/system"
)

# Default value for keep_releases is 5
set :keep_releases, 5

# DB SYNC
set :db_local_clean, true
set :disallow_pushing, true

# PUMA
set :puma_rackup, -> { File.join(current_path, 'config.ru') }
set :puma_state, "#{shared_path}/tmp/pids/puma.state"
set :puma_pid, "#{shared_path}/tmp/pids/puma.pid"
set :puma_bind, "tcp://0.0.0.0:9292"
set :puma_default_control_app, "unix://#{shared_path}/tmp/sockets/pumactl.sock"
set :puma_conf, "#{shared_path}/config/puma.rb"
set :puma_access_log, "#{shared_path}/log/puma_access.log"
set :puma_error_log, "#{shared_path}/log/puma_error.log"
set :puma_role, :app
set :puma_env, fetch(:stage)
set :puma_threads, -> { fetch(:stage).to_s == "staging" ? [0, 2] : [0, 16] }
set :puma_workers, -> { fetch(:stage).to_s == "staging" ? 1 : 2 }
set :puma_init_active_record, true
set :puma_preload_app, true
set :nginx_use_ssl, false
set :puma_worker_timeout, 30

set :bundle_binstubs, false
set :bundle_flags, "--deployment"
set :sidekiq_default_hooks, true
set :sidekiq_pid, File.join(shared_path, 'tmp', 'pids', 'sidekiq.pid') # ensure this path exists in production before deploying.
set :sidekiq_log, File.join(shared_path, 'log', 'sidekiq.log')
set :sidekiq_timeout, 10
set :sidekiq_role, :app
set :sidekiq_processes, 1
set :sidekiq_queue, "default"
set :sidekiq_concurrency, -> { fetch(:stage).to_s == "staging" ? 5 : nil }

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
    end
    invoke! 'sidekiq:restart'
  end

  after :restart, :"puma:restart"

  after :restart, :clear_cache do
    on roles(:app), in: :groups, limit: 3, wait: 10 do
    end
  end

  desc 'Upload config files'
  task :config do
    on roles(:app) do
      unless test "grep -Fxq \"rvm_trust_rvmrcs_flag=1\" ~/.rvmrc"
        execute "echo rvm_trust_rvmrcs_flag=1 >> ~/.rvmrc && source ~/.rvmrc"
      end

      upload! File.new('config/database.example.yml'), "#{deploy_to}/shared/config/database.yml"
      upload! File.new('config/secrets.example.yml'), "#{deploy_to}/shared/config/secrets.yml"
      upload! File.new('config/app.example.yml'), "#{deploy_to}/shared/config/app.yml"
      info "Now edit the config files in #{shared_path}/config."
    end
  end

end

set :git_branch, ask("请输入部署分支: ", `git branch | sed -n '/\* /s///p'`.chomp.strip)
set :formatted_git_branch, -> { fetch(:git_branch).gsub("_", "-") }
