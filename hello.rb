require 'sinatra'

get '/' do
  "Hello World!"
  The time is now: %= Time.now %>
end
