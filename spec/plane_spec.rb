require_relative '../lib/plane'

describe Plane do 

	let(:plane) {Plane.new}

	it 'has a flying status when created' do 
		expect(plane.plane_status).to eq('flying')
	end

	it 'has a flying status when in the air' do
		airport = double :airport
		expect(airport).to receive(:take_off)
		plane.fly(airport)
		expect(plane.flying).to eq('flying')
	end

	it 'can take off' do
		airport = double :airport
		expect(airport).to receive(:land_plane)
		plane.land(airport)
		expect(airport).to receive(:take_off)
		plane.fly(airport)
		expect(plane.flying).to eq('flying')
	end

	it 'change its status to flying after taking of' do
		airport = double :airport
		expect(airport).to receive(:take_off)
		plane.fly(airport)
		expect(plane.flying).to eq('flying')
	end

end