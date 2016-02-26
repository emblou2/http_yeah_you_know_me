require 'simplecov'
SimpleCov.start
require 'faraday'
require 'pry'
require 'minitest/autorun'
require 'minitest/pride'
require_relative '../lib/server'
require_relative '../lib/request'
require_relative '../lib/response'

class HelperTest < Minitest::Test
end
