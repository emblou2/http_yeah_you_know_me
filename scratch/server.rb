class Server

  attr_accessor :tcp_server

  def initialize
    @tcp_server = TCPServer.new(9292)
  end

end
