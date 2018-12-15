# config.ru
require File.expand_path('../config/application', __FILE__)
require 'rack/cors'

use Rack::Cors do
  allow do
    origins 'localhost:3000', '127.0.0.1:3000',
            'localhost:3001', '127.0.0.1:3001'
    resource '*', headers: :any, methods: :get
  end
end

run Application
