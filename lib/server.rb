require 'socket'
require 'pry'
require_relative 'request'
require_relative 'response'
require_relative 'game'

class Server

  attr_reader :hello_counter, :total_counter, :shutdown_counter

  def initialize
    @hello_counter = 0
    @total_counter = 0
    @shutdown_counter = 0
  end

  def start_server
    @tcp_server = TCPServer.new(9292)
  end

  def run_client
    while client_wants_to_talk? do
      accept_request
      package_request
      read_request
      send_response
    end
  end

  def client_wants_to_talk?
    @shutdown_counter == 0
  end

  def accept_request
    @client = @tcp_server.accept
    puts "\nReady for a request."
  end

  def package_request
    request_lines = []
    while line = @client.gets and !line.chomp.empty?
      request_lines << line.chomp
    end
    puts "Received request."
    @request = Request.new(request_lines)
  end

  def requests_hello?
    @request.request_hash[:Verb] == "GET" && @request.request_hash[:Path] == "/hello"
  end

  def requests_datetime?
    @request.request_hash[:Verb] == "GET" && @request.request_hash[:Path] == "/datetime"
  end

  def requests_shutdown?
    @request.request_hash[:Verb] == "GET" && @request.request_hash[:Path] == "/shutdown"
  end

  def requests_words?
    @request.request_hash[:Verb] == "GET" && @request.request_hash[:Path].split("?").first == "/word_search"
  end

  def requests_game?
    @request.request_hash[:Verb] == "POST" && @request.request_hash[:Path] == "/start_game"
  end

  def makes_a_guess?
      @request.request_hash[:Verb] == "POST" && @request.request_hash[:Path] == "/game"
  end

  def gets_to_game?
      @request.request_hash[:Verb] == "GET" && @request.request_hash[:Path] == "/game"
  end

  def read_request
    if requests_hello?
      @hello_counter += 1
      @total_counter += 1
      @response = Response.new(:hello, @hello_counter)
    elsif requests_datetime?
      @total_counter += 1
      @response = Response.new(:datetime)
    elsif requests_words?
      @total_counter += 1
      search_word = @request.request_hash[:Path].split("?").last.split("=").last
      @response = Response.new(:words, search_word)
    elsif requests_game?
      @total_counter += 1
      @game = Game.new
      @response = Response.new(:game_start)
    elsif makes_a_guess?
      @total_counter += 1
      guess = @request.request_hash[:Path].split("?").last.split("=").last
      @response = @game.update_guess(@guess)
    elsif gets_to_game?
      @total_counter += 1
      @response = Response.new(:game_check)
    elsif requests_shutdown?
      @shutdown_counter += 1
      @total_counter += 1
      @response = Response.new(:shutdown, @total_counter)
    else
      @total_counter += 1
      @response = Response.new(:other, @request)
    end
  end

  def send_response
    puts "Sending response."

    @client.puts @response.headers
    @client.puts @response.output

    puts "\nResponse: #{@response.output}"
    puts "\nTotal Counter: #{@total_counter}"
    @request.request_hash.each { |key, value| puts "#{key}: #{value}"}
  end

  def close_server
    @client.close
    puts "\nGoodbye. Come again soon!"
  end

end
