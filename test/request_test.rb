require 'minitest/autorun'
require 'minitest/pride'
require '../lib/request'

class TestRequestTest < Minitest::Test

  def test_a_new_instance_is_created
    request = Request.new("")

    assert_equal Request, request.class
  end

  def test_incoming_request_turns_into_hash
    request = Request.new(["GET / HTTP/1.1", "Host: 127.0.0.1:9292", "Connection: keep-alive", "Cache-Control: no-cache", "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36", "Postman-Token: df034da5-2f72-105d-b49f-8c6e70f024f4", "Accept: */*", "Accept-Encoding: gzip, deflate, sdch", "Accept-Language: en-US,en;q=0.8"])

    assert_equal request.incoming_to_hash[:host], "127.0.0.1"
    assert_equal request.incoming_to_hash[:port], "9292"
  end

end
