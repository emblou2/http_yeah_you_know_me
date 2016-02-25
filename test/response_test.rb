require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/response'
require_relative 'test_helper'
require 'simplecov'
SimpleCov.start

class ResponseTest < TestHelperTest

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

    response = incoming.response_builder(:datetime, "")
    time = Time.now.strftime("%I:%M%p on %A, %B %e, %Y")

    assert_equal "<pre>#{time}</pre>", response
  end

  def test_word_search_returns_result
    incoming = Response.new("","")

    response = incoming.response_builder(:words, "yay")

    assert_equal "<pre>yay is a known word</pre>", response
  end

  def test_output_is_built_properly
  end

  def test_headers_are_built_properly
  end

end
