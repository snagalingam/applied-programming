require "sinatra"
require "sinatra/reloader"
require "geocoder"
def view(template); erb template.to_sym; end
before { puts "Parameters: #{params}" }

get "/" do
  view "geocode"
end

get "/map" do
  results = Geocoder.search(params["location"])
  lat_long = results.first.coordinates
  "#{lat_long[0]} #{lat_long[1]}"
end
