require 'pry'

class Request

  def initialize(incoming_request)
    @incoming_request = incoming_request
  end

  def incoming_to_hash
    @request_hash = Hash.new
    @request_hash[:Verb] = @incoming_request.first.split[0]
    @request_hash[:Protocol] = @incoming_request.first.split[2]
    @request_hash[:Host] = @incoming_request[1].split[1].split(":").first
    @request_hash[:Path] = @incoming_request.first.split[1]
    @request_hash[:Port] = @incoming_request[1].split[1].split(":").last
  end

  def response
    "Hello World! (COUNTER GOES HERE)"
  end

  def request_hash
    @request_hash
  end


end
