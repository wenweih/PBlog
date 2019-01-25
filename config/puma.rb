app_root = Rails.root.to_s
threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }.to_i
threads threads_count, threads_count
environment ENV.fetch("RAILS_ENV") { "development"  }
pidfile "#{app_root}/tmp/pids/puma.pid"
state_path "#{app_root}/tmp/pids/puma.state"
bind "unix://#{app_root}/tmp/sockets/puma.sock"
daemonize true
stdout_redirect "#{app_root}/log/stdout", "#{app_root}/log/stderr"

workers ENV.fetch("WEB_CONCURRENCY") { 2 }

preload_app!

on_worker_boot do
  ActiveRecord::Base.establish_connection if defined?(ActiveRecord)
end

before_fork do
  ActiveRecord::Base.connection_pool.disconnect!
end

# Allow puma to be restarted by `rails restart` command.
plugin :tmp_restart
