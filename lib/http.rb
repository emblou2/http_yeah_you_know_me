require 'socket'
require 'pry'
require_relative 'request'

tcp_server = TCPServer.new(9292)
counter = 0

loop do
  client = tcp_server.accept

  puts "Ready for a request"
  request_lines = []
  while line = client.gets and !line.chomp.empty?
    request_lines << line.chomp
  end
  request = Request.new(request_lines)
  request.incoming_to_hash

  counter +=1

  puts "Got this request:"
  puts request_lines.join("\n") # should be something called on request


  puts "Sending response."
  # all of this should be moved to request class
#create another counter in request class for hello specifically.
#This will go in the request instance. Make a reaponse.rb to create
#a whole response class. It will handle all the path suff. Incriment
#conditional in hello counter.
  response = "<pre>Hello World! (#{counter})</pre>"
  output = "<html><head></head><body>#{response}</body></html>"
  headers = ["http/1.1 200 ok",
            "date: #{Time.now.strftime('%a, %e %b %Y %H:%M:%S %z')}",
            "server: ruby",
            "content-type: text/html; charset=iso-8859-1",
            "content-length: #{output.length}\r\n\r\n"].join("\r\n")
  client.puts headers
  client.puts output
end

puts ["Wrote this response:", headers, output].join("\n")
client.close
puts "\nResponse complete, exiting."
