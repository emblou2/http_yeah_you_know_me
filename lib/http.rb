require 'socket'
require 'pry'
require_relative 'request'

tcp_server = TCPServer.new(9292)

hello_counter = 0
total_counter = 0
shutdown_counter = 0

until shutdown_counter == 1 do
  client = tcp_server.accept

  puts "Ready for a request"

  request_lines = []
  while line = client.gets and !line.chomp.empty?
    request_lines << line.chomp
  end

  request = Request.new(request_lines)

  puts "Sending response."

  if request.request_hash[:Path] == "/hello"
    hello_counter += 1
    total_counter += 1
    response = "<pre>Hello World! #{hello_counter}</pre>"
  elsif request.request_hash[:Path] == "/datetime"
    total_counter += 1
    time = Time.now.strftime("%I:%M%p on %A, %B %e, %Y")
    response = "<pre>#{time}</pre>"
  elsif request.request_hash[:Path] == "/shutdown"
    shutdown_counter += 1
    total_counter += 1
    response = "<pre>Total Requests: #{total_counter}</pre>"
  else
    total_counter += 1
    response = "<pre>#{request.request_hash}</pre>"
  end

  if request.request_hash[:Verb] == "GET" && request.request_hash[:Path].split("?").first == "/word_search"
    all_words = File.read('/usr/share/dict/words')
    response = "<pre>dict search</pre>"
  end

  output = "<html><head></head><body>#{response}</body></html>"
  headers = ["http/1.1 200 ok",
            "date: #{Time.now.strftime('%a, %e %b %Y %H:%M:%S %z')}",
            "server: ruby",
            "content-type: text/html; charset=iso-8859-1",
            "content-length: #{output.length}\r\n\r\n"].join("\r\n")
  client.puts headers
  client.puts output

  puts "#{total_counter}"
  puts "\n#{request.request_hash}"

end

client.close
puts "\nResponse complete, exiting."
puts "\n#{request.request_hash}"
