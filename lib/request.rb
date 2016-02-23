require 'pry'

class Request

  attr_reader :response, :output, :headers, :formatted_request

  def initialize(incoming_request, count)
    @incoming_request = incoming_request
    @count = count
  end

  def incoming_to_hash
    request_hash = Hash.new
    request_hash[:Verb] = @incoming_request.first.split[0]
    request_hash[:Protocol] = @incoming_request.first.split[2]
    request_hash[:Host] = @incoming_request[1].split[1].split(":").first
    request_hash[:Path] = @incoming_request.first.split[1]
    request_hash[:Port] = @incoming_request[1].split[1].split(":").last
    formatted_request(request_hash)
  end

  def formatted_request(request_hash)
    puts "Got this request:"

    formatted_request = ["<pre>",
    "Verb: #{request_hash[:Verb]}",
    "Path: #{request_hash[:Path]}",
    "Protocol: #{request_hash[:Protocol]}",
    "Host: #{request_hash[:Host]}",
    "Port: #{request_hash[:Port]}"].join
    puts formatted_request
  end

  def response
    "Hello World! (COUNTER GOES HERE)"
    @response = "<pre>Hello World! #{@count}</pre>"
    @output = "<html><head></head><body>#{@response}</body></html>"
    @headers = ["http/1.1 200 ok",
              "date: #{Time.now.strftime('%a, %e %b %Y %H:%M:%S %z')}",
              "server: ruby",
              "content-type: text/html; charset=iso-8859-1",
              "content-length: #{output.length}\r\n\r\n"].join("\r\n")
  end

  def request_hash
    @request_hash
  end


end
