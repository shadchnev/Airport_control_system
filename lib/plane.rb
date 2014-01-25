class Plane

	def initialize
		flying
	end

	def plane_status
		@status
	end

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