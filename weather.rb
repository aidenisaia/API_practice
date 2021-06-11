require "http"

loop do
  system "clear"
  puts "What's a city do you want to know the forcast of?"
  city = gets.chomp

  puts "Do you want Celcius or Farenheit"
  unit = gets.chomp
  if unit == "farenheit"
    unit = "imperial"
  elsif unit == "celcius"
    unit = "metric"
  else
    puts "error"
  end

  response = HTTP.get("http://api.openweathermap.org/data/2.5/weather?q=#{city}&appid=#{ENV['OPEN_WEATHER_API_KEY']}&units=#{unit}")

  weather_data = response.parse(:json)
  temperature = weather_data['main']['temp']

  p temperature

  puts "Want to know the forcast of another city? Y or N"
  answer = gets.chomp
  if answer == "n"
    break
  end
end