require 'pry'
require_relative '../lib/server'

# start the server
server = Server.new
server.run_client
