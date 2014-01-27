require_relative '../lib/weather'

# class names should never have underscores,
# use camelCase instead: WeatherForecast
class Weather_forecast; include Weather; end

describe 'Weather' do 

context 'weather condition' do

  # This test doesn't do what it promises to do because it doesn't
  # involve the airport or planes.
  # Furthermore, it will never ever fail because the only thing it
  # tests is that the stub works. 
  # You should have checked that the test fails before writing the code.
  # A test that never fails is useless.
	it 'a plane cannot take off when there is a storm brewing' do
		weather = Weather_forecast.new
		weather.stub(:current_weather).and_return(:stormy)
		expect(weather.current_weather).to eq(:stormy)
	end

end
	
end