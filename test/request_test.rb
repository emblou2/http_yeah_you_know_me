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

  def test_requsting_root_gives_standard_info
    request_root = Request.new(Path: "/")
    request_none = Request.new("")

    assert_equal request_root.response, request_none.response
    # means we need to move the generation of the response
    # to the request class
  end

  def test_requesting_hello_gives_path_count
    request1 = Request.new(Path: "/hello")
    request2 = Request.new(Path: "/hello")
    request3 = Request.new("")
    request4 = Request.new(Path: "/hello")

    assert_equal "Hello, World! (1)", request1.response
    assert_equal "Hello, World! (2)", request2.response
    assert_equal "Hello, World! (3)", request4.response
    # again means we need to move the counter to request class
  end

  def test_requesting_datetime_gives_todays_date_and_time
    request = Request.new(Path: "/datetime")

    current_time = Time.now.strftime("%I:%M%p on %A, %B %e, %Y")

    assert_equal current_time, request.response
  end

  def test_requesting_shutdown_gives_total_requests_and_stops_server
    request1 = Request.new(Path: "/")
    request2 = Request.new("")
    request3 = Request.new("")
    request4 = Request.new(Path: "/hello")
    request5 = Request.new(Path: "/shutdown")

    assert_equal "Total Requests: 5. Responses complete, exiting.", request5.response
    # means we need to create this instance variable
  end

end
