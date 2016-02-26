require 'faraday'
require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/server'
require_relative 'test_helper'

class ServerTest < HelperTest

  def test_standard_path_returns_default
    far = Faraday.get("http://localhost:9292")
    output = "<html><head></head><body><pre>{:Verb=>\"GET\", :Protocol=>\"HTTP/1.1\", :Host=>\"Faraday\", :Path=>\"/\", :Port=>\"Faraday\"}</pre></body></html>"

    assert_equal output, far.body
  end

  def test_unknown_path_returns_default
    far = Faraday.get("http://localhost:9292/slfjdk")
    output = "<html><head></head><body><pre>{:Verb=>\"GET\", :Protocol=>\"HTTP/1.1\", :Host=>\"Faraday\", :Path=>\"/slfjdk\", :Port=>\"Faraday\"}</pre></body></html>"

    assert_equal output, far.body
  end

  def test_hello_path_returns_hello_and_increments_hello
    far = Faraday.get("http://localhost:9292/hello")
    a = Faraday.get("http://localhost:9292/")
    day = Faraday.get("http://localhost:9292/hello")
    output = "<html><head></head><body><pre>Hello World! (2)</pre></body></html>"

    assert_equal output, day.body
  end

  def test_datetime_returns_date_and_time
    far = Faraday.get("http://localhost:9292/datetime")
    time = Time.now.strftime("%I:%M%p on %A, %B %e, %Y")

    output = "<html><head></head><body><pre>#{time}</pre></body></html>"

    assert_equal output, far.body
  end

  def test_post_start_game_returns_good_luck
    far = Faraday.post("http://localhost:9292/start_game")

    output = "<html><head></head><body><pre>Good luck!</pre></body></html>"

    assert_equal output, far.body
  end

  def test_get_guess_returns_result
    start = Faraday.post("http://localhost:9292/start_game")
    guess = Faraday.get("http://localhost:9292/game?param=2")

    output = "<html><head></head><body><pre>There have been 1 guesses. 2 is too low</pre></body></html>"

    assert_equal output, guess.body
  end


end
