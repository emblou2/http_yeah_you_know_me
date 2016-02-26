require 'pry'
require_relative '../lib/server'

# start the server
server = Server.new
server.start_server
server.run_client
