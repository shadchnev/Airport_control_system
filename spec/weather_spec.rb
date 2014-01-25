require_relative '../lib/weather'

class Weather_forecast; include Weather; end

describe 'Weather' do 

context 'weather condition' do

	it 'a plane cannot take off when there is a storm brewing' do
		weather = Weather_forecast.new
		weather.stub(:current_weather).and_return(:stormy)
		expect(weather.current_weather).to eq(:stormy)
	end

end
	
end