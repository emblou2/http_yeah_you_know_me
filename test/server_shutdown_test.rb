require 'faraday'
require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/server'
require_relative 'test_helper'

class ServerShutdownTest < HelperTest

    def test_shutdown_shuts_server_down_and_increments_total_count_properly
      request_one = Faraday.get("http://localhost:9292/")
      request_two = Faraday.get("http://localhost:9292/hello")
      request_three = Faraday.get("http://localhost:9292/datetime")
      request_four = Faraday.get("http://localhost:9292/")
      request_five = Faraday.get("http://localhost:9292/shutdown")

      # output should be 5 if just running shutdown test alone
      output = "<html><head></head><body><pre>Total Requests: 13</pre></body></html>"

      assert_equal output, request_five.body
    end

end
