require 'simplecov'
SimpleCov.start
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/request'
require_relative 'test_helper'

class RequestTest < HelperTest

  def test_incoming_request_turns_into_hash
    request = Request.new(["GET / HTTP/1.1",
                           "Host: 127.0.0.1:9292",
                           "Connection: keep-alive",
                           "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8",
                           "Upgrade-Insecure-Requests: 1",
                           "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36",
                           "Accept-Encoding: gzip, deflate, sdch",
                           "Accept-Language: en-US,en;q=0.8"])

    assert_equal "GET", request.request_hash[:Verb]
    assert_equal "127.0.0.1", request.request_hash[:Host]
    assert_equal "9292", request.request_hash[:Port]
    assert_equal "/", request.request_hash[:Path]
    assert_equal "HTTP/1.1", request.request_hash[:Protocol]
  end

  def test_request_knows_hello
    request = Request.new(["GET /hello HTTP/1.1",
                           "Host: 127.0.0.1:9292",
                           "Connection: keep-alive",
                           "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8",
                           "Upgrade-Insecure-Requests: 1",
                           "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36",
                           "Accept-Encoding: gzip, deflate, sdch",
                           "Accept-Language: en-US,en;q=0.8"])

    assert_equal "/hello", request.request_hash[:Path]

  end

  def test_request_knows_datetime
    request = Request.new(["GET /datetime HTTP/1.1",
                           "Host: 127.0.0.1:9292",
                           "Connection: keep-alive",
                           "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8",
                           "Upgrade-Insecure-Requests: 1",
                           "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36",
                           "Accept-Encoding: gzip, deflate, sdch",
                           "Accept-Language: en-US,en;q=0.8"])

    assert_equal "/datetime", request.request_hash[:Path]
  end

  def test_request_knows_shutdown
    request = Request.new(["GET /shutdown HTTP/1.1",
                           "Host: 127.0.0.1:9292",
                           "Connection: keep-alive",
                           "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8",
                           "Upgrade-Insecure-Requests: 1",
                           "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36",
                           "Accept-Encoding: gzip, deflate, sdch",
                           "Accept-Language: en-US,en;q=0.8"])

    assert_equal "/shutdown", request.request_hash[:Path]
  end

  def test_request_knows_word_search
    request = Request.new(["GET /word_search HTTP/1.1",
                           "Host: 127.0.0.1:9292",
                           "Connection: keep-alive",
                           "Accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,*/*;q=0.8",
                           "Upgrade-Insecure-Requests: 1",
                           "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_10_5) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2564.116 Safari/537.36",
                           "Accept-Encoding: gzip, deflate, sdch",
                           "Accept-Language: en-US,en;q=0.8"])

    assert_equal "/word_search", request.request_hash[:Path]
  end

end
