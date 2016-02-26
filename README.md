BDD - Where we are right now

We are trying to build a simple server in order to understand how the HTTP request/response cycle works.

BDD - What the process will be

# open bash and run our ruby file
$ ruby bin/runner.rb

# input requests through browser GET and POST requests
- GET to receive request information
- GET /hello to get "Hello, World! (number of hellos)"
- GET /datetime to get today's date and time in this format: 11:07AM on Sunday, November 1, 2015
- GET /shutdown to get "Total Requests: (number of requests)" and to close server
- GET /word_search?param=value to get response indicating whether "value" is in the dictionary on their mac
