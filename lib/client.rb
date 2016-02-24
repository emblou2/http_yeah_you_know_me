require 'socket'
require 'pry'

class Client

  def initialize(tcp_server)
    tcp_server.accept
    request_lines = []
    while line = client.gets and !line.chomp.empty?
      request_lines << line.chomp
    end
    self.send_response
  end

  def send_response
    puts "from client class"
  end

end
