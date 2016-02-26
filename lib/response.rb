require 'pry'
require_relative 'server'

class Response

  attr_reader :output, :headers, :response

  def initialize(type, word_or_count_or_request = 0)
    response_builder(type, word_or_count_or_request)
    make_output
    make_headers(type)
  end

  def response_builder(type, data)
    if type == :hello
      @response = "<pre>Hello World! (#{data})</pre>"
    elsif type == :shutdown
      puts "Shutting down."
      @response = "<pre>Total Requests: #{data}</pre>"
    elsif type == :datetime
      time = Time.now.strftime("%I:%M%p on %A, %B %e, %Y")
      @response = "<pre>#{time}</pre>"
    elsif type == :words
      all_words = File.read('/usr/share/dict/words')
      if all_words.include?(data)
        @response = "<pre>#{data} is a known word</pre>"
      else
        @response = "<pre>#{data} is not a known word</pre>"
      end
    elsif type == :game_start
      @response = "<pre>Good luck!</pre>"
    elsif type == :guess
      @response = "<pre>redirected</pre>"
    # elsif type == :game_check
    #   @response = "<pre>There have been 1 guesses. 5 is too low.</pre>"
    elsif type == :other
      @response = "<pre>#{data.request_hash}</pre>"
    end
  end

  def make_output
    @output = "<html><head></head><body>#{@response}</body></html>"
  end

  def make_headers(type)
    if type == :guess
      @headers = ["http/1.1 301 Moved Permanently",
      "Location: http://localhost:9292/game",
      "date: #{Time.now.strftime('%a, %e %b %Y %H:%M:%S %z')}",
      "server: ruby",
      "content-type: text/html; charset=iso-8859-1",
      "content-length: #{@output.length}\r\n\r\n"].join("\r\n")
    else
      @headers = ["http/1.1 200 ok",
      "date: #{Time.now.strftime('%a, %e %b %Y %H:%M:%S %z')}",
      "server: ruby",
      "content-type: text/html; charset=iso-8859-1",
      "content-length: #{@output.length}\r\n\r\n"].join("\r\n")
    end
  end

end
