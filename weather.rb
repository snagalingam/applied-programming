require "forecast_io"

# configure the Dark Sky API with your API key
ForecastIO.api_key = "02474b061a5e865db7fa38366b664a31"

# do the heavy lifting, use Global Hub lat/long
forecast = ForecastIO.forecast(42.0574063,-87.6722787).to_hash
# pp = pretty print
# use instead of `puts` to make reading a hash a lot easier
# e.g. `pp forecast`

current_temp = forecast["currently"]["temperature"]
current_state = forecast["currently"]["summary"]
forecast_array = forecast["daily"]["data"]

puts "In Chicago, it is currently #{current_temp} degrees and #{current_state}"
puts "-------------------"
puts "Extended forecast:"
for day in forecast_array
  puts "A high temperature of #{day["temperatureHigh"]} and #{day["summary"]}"
end
