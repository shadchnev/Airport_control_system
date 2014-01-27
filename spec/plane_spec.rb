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
		# the next three lines repeat the next one, so they should be here at all
		expect(airport).to receive(:take_off)
		plane.fly(airport)
		expect(plane.flying).to eq('flying')
	end

	# So, this test is exactly the same as the one that checks that
	# the plane as a flying status when in the air. Why have two tests
	# that do exactly the same thing?
	it 'change its status to flying after taking of' do
		airport = double :airport
		expect(airport).to receive(:take_off)
		plane.fly(airport)
		expect(plane.flying).to eq('flying')
	end

end