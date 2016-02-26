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

    response = incoming.response_builder(:datetime, "")

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

end
