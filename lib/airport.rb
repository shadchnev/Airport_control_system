class Airport

	DEFAULT_CAPACITY = 100

	def initialize
		@plane = []
	end

	# def plane
	# 	@plane
	# end

	def plane_count
		@plane.count
	end

	def land(plane)
		raise "Airport full: cannot land" if full?

		@plane << plane
	end

	def take_off(plane)
		@plane.delete(plane)
	end

	def full?
		plane_count == capacity
	end

	def capacity
		DEFAULT_CAPACITY
	end 

end

