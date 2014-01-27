class Plane

	def initialize
		flying
	end

	def plane_status
		@status
	end

	# There's no reason to have these two methods
	# because the airport is doing all the work anyway
	def fly(airport)
		airport.take_off(self)
		flying
	end

	def land(airport)
		airport.land_plane(self)
		landed
	end

	def flying
		@status = 'flying'
	end

	def landed
		@status = 'landed'
	end
end