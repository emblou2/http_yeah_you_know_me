require 'faraday'
require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/server'

class ServerTest < Minitest::Test

  def test_standard_path_returns_default
    far = Faraday.get("http://localhost:9292")

    response = "<html><head></head><body><pre>{:Verb=>\"GET\", :Protocol=>\"HTTP/1.1\", :Host=>\"Faraday\", :Path=>\"/\", :Port=>\"Faraday\"}</pre></body></html>"

    assert_equal response, far.body
  end
end
