require 'socket'
require 'pry'
require_relative 'request'
require_relative 'counter'

tcp_server = TCPServer.new(9292)
@counter = Counter.new
binding.pry

loop do
  client = tcp_server.accept

  puts "Ready for a request"
  request_lines = []
  while line = client.gets and !line.chomp.empty?
    request_lines << line.chomp
  end
  request = Request.new(request_lines, @counter.count)
  request.incoming_to_hash
  request.response

  puts "Sending response."
  client.puts request.headers
  client.puts request.output
  @counter.increment
end

client.close
puts "\nResponse complete, exiting."
