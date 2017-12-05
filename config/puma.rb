threads_count = ENV.fetch("RAILS_MAX_THREADS") { 5 }.to_i
threads threads_count, threads_count

workers ENV.fetch("WEB_CONCURRENCY") { 2 }
on_worker_boot do
  ActiveRecord::Base.establish_connection if defined?(ActiveRecord)
end

before_fork do
  ActiveRecord::Base.connection_pool.disconnect!
end

# Allow puma to be restarted by `rails restart` command.
plugin :tmp_restart
