require 'socket'
require 'pry'
require_relative 'request'
require_relative 'response'

class Server

  attr_accessor :tcp_server

  def initialize
    @hello_counter = 0
    @total_counter = 0
    @shutdown_counter = 0
    @tcp_server = TCPServer.new(9292)
  end

  def run_client
    while @shutdown_counter == 0 do
      client = @tcp_server.accept
      puts "Ready for a request."

      request_lines = []
      while line = client.gets and !line.chomp.empty?
        request_lines << line.chomp
      end

      @request = Request.new(request_lines)

      parse_request

      puts "Sending response."

      client.puts @response.headers
      client.puts @response.output

      puts "\nResponse: #{@response.output}"
      puts "\nTotal Counter: #{@total_counter}"
      @request.request_hash.each { |key, value| puts "#{key}: #{value}"}
    end
    client.close
    puts "\nResponse complete, exiting."
  end

  def requests_hello?
    @request.request_hash[:Path] == "/hello"
  end

  def requests_datetime?
    @request.request_hash[:Path] == "/datetime"
  end

  def requests_shutdown?
    @request.request_hash[:Path] == "/shutdown"
  end

  def requests_words?
    @request.request_hash[:Verb] == "GET" && @request.request_hash[:Path].split("?").first == "/word_search"
  end

  def parse_request
    if requests_hello?
      @hello_counter += 1
      @total_counter += 1
      @response = Response.new(:hello, @hello_counter)
    elsif requests_datetime?
      @total_counter += 1
      @response = Response.new(:datetime)
    elsif requests_shutdown?
      @shutdown_counter += 1
      @total_counter += 1
      @response = Response.new(:shutdown, @total_counter)
    elsif requests_words?
      @total_counter += 1
      search_word = @request.request_hash[:Path].split("?").last.split("=").last
      @response = Response.new(:words, search_word)
    else
      @total_counter += 1
      @response = Response.new(:other, @request)
    end
  end

end
