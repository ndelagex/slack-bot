# This file is used by Rack-based servers to start the application.

require 'dotenv'
Dotenv.load

require_relative 'config/environment'
#require_relative 'bot/pongbot'
require_relative 'bot/micheline'

Thread.abort_on_exception = true
Thread.new do
  Micheline.run
end

run Rails.application
