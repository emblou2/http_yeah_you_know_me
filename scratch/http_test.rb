require 'faraday'
require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require '../lib/request'
require '../lib/http'

class HttpTest < Minitest::Test

  def test_standard_path_returns_default
    Faraday.get("localhost:9292")

    response_body = "<html><head></head><body><pre>Hello World! 1</pre></body></html>"

    assert_equal response_body, resp_body
  end


  #
  # def test_standard_path_returns_default
  #   request = Request.new(["GET / HTTP/1.1",
  #                          "Host: 127.0.0.1:9292",
  #                          "Connection: keep-alive",
  #                          "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8",
  #                          "Upgrade-Insecure-Requests: 1",
  #                          "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36",
  #                          "Accept-Encoding: gzip, deflate, sdch",
  #                          "Accept-Language: en-US,en;q=0.8"])
  #
  #   debug_response = request.request_hash
  #
  #   assert_equal debug_response, response
  # end
  #
  # def test_path_hello_returns_hello_counter
  #   request1 = Request.new(["GET /hello HTTP/1.1",
  #                          "Host: 127.0.0.1:9292",
  #                          "Connection: keep-alive",
  #                          "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8",
  #                          "Upgrade-Insecure-Requests: 1",
  #                          "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36",
  #                          "Accept-Encoding: gzip, deflate, sdch",
  #                          "Accept-Language: en-US,en;q=0.8"])
  #
  #   request2 = Request.new(["GET / HTTP/1.1",
  #                          "Host: 127.0.0.1:9292",
  #                          "Connection: keep-alive",
  #                          "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8",
  #                          "Upgrade-Insecure-Requests: 1",
  #                          "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36",
  #                          "Accept-Encoding: gzip, deflate, sdch",
  #                          "Accept-Language: en-US,en;q=0.8"])
  #
  #   request3 = Request.new(["GET /hello HTTP/1.1",
  #                         "Host: 127.0.0.1:9292",
  #                         "Connection: keep-alive",
  #                         "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8",
  #                         "Upgrade-Insecure-Requests: 1",
  #                         "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36",
  #                         "Accept-Encoding: gzip, deflate, sdch",
  #                         "Accept-Language: en-US,en;q=0.8"])
  #
  #   assert_equal "Hello, World! (2)", response
  # end
  #
  # def test_path_datetime_returns_date_time
  #   request1 = Request.new(["GET /datetime HTTP/1.1",
  #                          "Host: 127.0.0.1:9292",
  #                          "Connection: keep-alive",
  #                          "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8",
  #                          "Upgrade-Insecure-Requests: 1",
  #                          "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36",
  #                          "Accept-Encoding: gzip, deflate, sdch",
  #                          "Accept-Language: en-US,en;q=0.8"])
  #
  #   time = current_time = Time.now.strftime("%I:%M%p on %A, %B %e, %Y")
  #
  #   assert_equal time, response
  # end
  #
  # def test_shutdown_returns_total_requests_and_quits
  # end
  #
end
