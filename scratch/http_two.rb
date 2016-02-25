require 'socket'
require 'pry'
require_relative 'request'

tcp_server = TCPServer.new(9292)
counter = 0

loop do

  client = tcp_server.accept

  puts "Ready for a request"
  request = Request.new

  puts "Got this request:"
  request.formatted

  puts "Sending response."

  client.puts response.headers
  client.puts response.output

end
