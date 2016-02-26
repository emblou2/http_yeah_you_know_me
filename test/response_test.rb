require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/response'
require_relative 'test_helper'

class ResponseTest < HelperTest

  def test_new_response_exists
    incoming = Response.new("","")

    assert_equal Response, incoming.class
  end

  def test_request_hello_builds_greeting_with_counter
    incoming = Response.new("","")

    response = incoming.response_builder(:hello, 1)

    assert_equal "<pre>Hello World! (1)</pre>", response
  end

  def test_request_shutdown_builds_response
    incoming = Response.new("","")

    response = incoming.response_builder(:shutdown, 3)

    assert_equal "<pre>Total Requests: 3</pre>", response
  end

  def test_request_datetime_builds_response
    incoming = Response.new("","")
    time = Time.now.strftime("%I:%M%p on %A, %B %e, %Y")

    response = incoming.response_builder(:datetime, 0)

    assert_equal "<pre>#{time}</pre>", response
  end

  def test_word_search_returns_result_for_known_word
    incoming = Response.new("","")

    response = incoming.response_builder(:words, "yes")

    assert_equal "<pre>yes is a known word</pre>", response
  end

  def test_word_search_returns_result_for_known_word
    incoming = Response.new("","")

    response = incoming.response_builder(:words, "sdfl")

    assert_equal "<pre>sdfl is not a known word</pre>", response
  end

  def test_knows_a_new_game
    incoming = Response.new("","")

    response = incoming.response_builder(:game_start, 0)

    assert_equal "<pre>Good luck!</pre>", response
  end

  def test_response_to_guess_has_redirect
    incoming = Response.new("","")

    response = incoming.make_headers(:guess)

    assert_equal ["http/1.1 301 Moved Permanently",
                  "Location: http://localhost:9292/game",
                  "date: #{Time.now.strftime('%a, %e %b %Y %H:%M:%S %z')}",
                  "server: ruby",
                  "content-type: text/html; charset=iso-8859-1",
                  "content-length: 39\r\n\r\n"].join("\r\n"), response
  end

  def test_gives_response_to_game_check
    incoming = Response.new("","")

    response = incoming.response_builder(:game_check, 5)

    assert_equal "<pre>There have been 1 guesses. 5 is too low.</pre>", response
  end

end
