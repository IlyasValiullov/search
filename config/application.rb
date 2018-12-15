# application.rb
require 'grape'

class App
  @@path = "#{File.dirname(__FILE__)}/.."
  def self.path
    @@path
  end
end

# Load files from the models and api folders
Dir["#{App.path}/app/api/*.rb"].each { |f| require f }
Dir["#{App.path}/app/lib/**/*.rb"].each { |f| require f }


Repository.register(:language, FileRepository::LanguageRepository.new)

# Mounting the Grape application
Application = Rack::Builder.new do
  map "/" do
    run API::Search
  end
end

