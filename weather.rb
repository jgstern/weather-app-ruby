require 'rubygems'
require 'yahoo_weatherman'

def current_weather(loc)
	client = Weatherman::Client.new
	response = client.lookup_by_location(loc)
	return response
end

#http://apidock.com/ruby/DateTime/strftime
today = Time.now.strftime('%w').to_i

puts "What is your location (ZIP code, city, state, etc)?"
location = gets

weather = current_weather(location)

puts "Currently it is #{weather.condition['text']} and #{weather.condition['temp']} °C."

forecasts = weather.forecasts

forecasts.each do |forecast|
	day = forecast['date'].strftime('%w').to_i
	
	if (day == today)
		puts "Today it will be #{forecast['text']} with a low of #{forecast['low']} °C and a high of #{forecast['high']} °C."
	elsif (day == (today+1))
		puts "Tomorrow it will be #{forecast['text']} with a low of #{forecast['low']} °C and a high of #{forecast['high']} °C."
	else
		puts "On #{forecast['day']} it will be #{forecast['text']} with a low of #{forecast['low']} °C and a high of #{forecast['high']} °C."
	end
end
