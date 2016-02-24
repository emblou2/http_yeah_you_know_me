require 'socket'
require 'pry'
require_relative 'request'

tcp_server = TCPServer.new(9292)

hello_counter = 0
total_counter = 0

loop do
  client = tcp_server.accept

  request_lines = []
  while line = client.gets and !line.chomp.empty?
    request_lines << line.chomp
  end

  request = Request.new(request_lines)

  puts "Ready for a request"
  total_counter += 1

  puts "Got this request:"

  puts "Sending response."
  response = "<pre>Hello World! #{total_counter}</pre>"
  output = "<html><head></head><body>#{response}</body></html>"
  headers = ["http/1.1 200 ok",
            "date: #{Time.now.strftime('%a, %e %b %Y %H:%M:%S %z')}",
            "server: ruby",
            "content-type: text/html; charset=iso-8859-1",
            "content-length: #{output.length}\r\n\r\n"].join("\r\n")
  client.puts headers
  client.puts output

  puts "#{total_counter}"

end

client.close
puts "\nResponse complete, exiting."
