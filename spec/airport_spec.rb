require_relative '../lib/airport'

describe 'Airport' do 

	let(:airport) {Airport.new}

	context 'taking off and landing' do 

		it 'a plane can land' do
			plane = double :plane
			expect(airport.plane_count).to eq(0)
			airport.land(plane)
			expect(airport.plane_count).to eq(1)
		end

		it 'a plane can take off' do 
			plane = double :plane
			airport.land(plane)
			expect(airport.plane_count).to eq(1)
			airport.take_off(plane)
			expect(airport.plane_count).to eq(0)
		end

		it '2 planes land and 1 takes off' do
			plane1, plane = double :plane
			airport.land(plane1)
			airport.land(plane)
			expect(airport.plane_count).to eq(2)
			airport.take_off(plane1)
			expect(airport.plane_count).to eq(1)
		end

		context 'traffic control' do

			it 'a plane cannot land if the airport is full' do
				plane = double :plane
				expect(airport).to_not be_full
				100.times { airport.land(plane) }
				expect(airport).to be_full
				expect{ airport.land(plane) }.to raise_error('Airport full: cannot land')
			end

		end

	end

end