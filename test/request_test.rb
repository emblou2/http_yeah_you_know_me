require 'minitest/autorun'
require 'minitest/pride'
require '../lib/request'

class TestRequestTest < Minitest::Test

  def test_incoming_request_turns_into_hash
    request = Request.new(["GET / HTTP/1.1",
                           "Host: 127.0.0.1:9292",
                           "Connection: keep-alive",
                           "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8",
                           "Upgrade-Insecure-Requests: 1",
                           "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36",
                           "Accept-Encoding: gzip, deflate, sdch",
                           "Accept-Language: en-US,en;q=0.8"])

    assert_equal request.request_hash[:Host], "127.0.0.1"
    assert_equal request.request_hash[:Port], "9292"
    assert_equal request.request_hash[:Path], "/"
    assert_equal request.request_hash[:Protocol], "HTTP/1.1"
  end

end
