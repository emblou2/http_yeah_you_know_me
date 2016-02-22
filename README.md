BDD - Where we are right now

We are trying to build a simple server in order to understand how the HTTP request/response cycle works.

BDD - What the process will be

# open bash and run our ruby file
$ ruby http.rb

# REQUEST FROM USER
require 'socket'
tcp_server = TCPServer.new(9292)
client = tcp_server.accept

# & COMPREHENDING REQUEST'S INTENT AND SOURCE & GENERATING RESPONSE & SENDING RESPONSE
# while that is running go to browser and enter http://127.0.0.1:9292 in url so that browser shows
"Hello, World! (0)" # the first time that we visit the url
"Hello, World! (1)" # the second time that we visit the url

# meanwhile, the bash output
"Hello, World! (0)" # the first time that we visit the url
"Hello, World! (1)" # the second time that we visit the url

# "restart the server" whatever that means and then visit the url again
"Hello, World! (0)" # to see the count at zero again

Question for Jeff:
  1) where did the ip address 127.0.0.1 come from? Can we assume that's where we'll always go?
