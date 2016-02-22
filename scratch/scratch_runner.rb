require_relative 'counter'
require_relative 'http_messing_around'

# start the counter
@counter = Counter.new
@counter.increment

def counter
  @counter
end

# start http
`ruby http_messing_around.rb`
puts "\nResponse complete, exiting."
