class Airport



	def initialize
		@plane = []
	end

	def plane_count
		@plane.count
	end

	def land(plane)
		@plane << plane
	end

	def take_off(plane)
		@plane.delete(plane)
	end

end

