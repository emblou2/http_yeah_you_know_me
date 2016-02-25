require 'pry'

class Request

  attr_reader :request_hash

  def initialize(request_lines)
    request_to_hash(request_lines)
  end

  def request_to_hash(request_lines)
    @request_hash = Hash.new
    @request_hash[:Verb] = request_lines.first.split[0]
    @request_hash[:Protocol] = request_lines.first.split[2]
    @request_hash[:Host] = request_lines[1].split[1].split(":").first
    @request_hash[:Path] = request_lines.first.split[1]
    @request_hash[:Port] = request_lines[1].split[1].split(":").last
  end

end
