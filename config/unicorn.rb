worker_processes Integer(ENV["WEB_CONCURRENCY"] || 3)
preload_app true
timeout 15

before_fork do |server, worker|
	ActiveRecord::Base.connection.disconnect! if defined?(ActiveRecord::Base)
end

after_fork do |server, worker|
	ActiveRecord::Base.establish_connection if defined?(ActiveRecord::Base)
end