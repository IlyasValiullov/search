# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative 'config/application'


task default: %w[routes]
task :routes do
  API::Search.routes.each do |route|
    info = route.instance_variable_get :@options
    puts "#{info[:method]}  #{route.path}"
  end
end
