require_relative '../lib/airport'

describe 'Airport' do 

	let(:airport) {Airport.new}
	let(:plane) { double :plane}

	context 'taking off and landing' do 

		it 'a plane can land' do
			expect(airport.plane_count).to eq(0)
			airport.stub(:current_weather).and_return(:sunny)
			expect(plane).to receive(:landed)
			airport.land_plane(plane)

			expect(airport.plane_count).to eq(1)
		end

		it 'a plane can take off' do
			airport.stub(:current_weather).and_return(:sunny) 
			expect(plane).to receive(:landed)
			airport.land_plane(plane)
			expect(airport.plane_count).to eq(1)
			airport.stub(:current_weather).and_return(:sunny)
			expect(plane).to receive(:flying)
			airport.take_off(plane)
			expect(airport.plane_count).to eq(0)
		end

		context 'traffic control' do

			it 'a plane cannot land if the airport is full' do
				expect(airport).to_not be_full
				100.times { 
									airport.stub(:current_weather).and_return(:sunny)
									expect(plane).to receive(:landed)
									airport.land_plane(plane) 
									}
				expect(airport).to be_full 
				expect{ airport.land_plane(plane) }.to raise_error('Airport full: cannot land')
			end

		end

		context 'weather condition' do

			it 'a plane cannot take off when there is a storm brewing' do
				airport.stub(:current_weather).and_return(:stormy)
				expect{ airport.take_off(plane) }.to raise_error("cannot take off: Stormy weather")
			end

			it 'a plane cannot land in the middle of a storm' do
				airport.stub(:current_weather).and_return(:stormy)
				expect{ airport.land_plane(plane)}.to raise_error("cannot land: Stormy weather")
			end

		end

	end

end