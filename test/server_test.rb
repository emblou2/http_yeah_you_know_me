require 'faraday'
require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/server'
require_relative 'test_helper'
require 'simplecov'
SimpleCov.start

class ServerTest < TestHelperTest

  def test_standard_path_returns_default
    far = Faraday.get("http://localhost:9292")
    output = "<html><head></head><body><pre>{:Verb=>\"GET\", :Protocol=>\"HTTP/1.1\", :Host=>\"Faraday\", :Path=>\"/\", :Port=>\"Faraday\"}</pre></body></html>"

    assert_equal output, far.body
  end

  def test_hello_path_returns_hello
    far = Faraday.get("http://localhost:9292/hello")
    output = "<html><head></head><body><pre>Hello World! (1)</pre></body></html>"
    assert_equal output, far.body
  end
end
