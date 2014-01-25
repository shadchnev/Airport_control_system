require_relative './weather'

class Airport

	include Weather

	DEFAULT_CAPACITY = 100

	def initialize
		@plane = []
	end

	def plane_count
		@plane.count
	end

	def land_plane(plane)
		raise "Airport full: cannot land" if full?
		raise "cannot land: Stormy weather" if current_weather == :stormy
		@plane << plane
		plane.landed
	end

	def take_off(plane)
		raise "cannot take off: Stormy weather" if current_weather == :stormy
		@plane.delete(plane)
		plane.flying
	end

	def capacity
		DEFAULT_CAPACITY
	end 

	def full?
		plane_count == capacity
	end

	

end

