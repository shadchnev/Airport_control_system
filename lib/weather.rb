module Weather

	STATE = [:sunny, :stormy]

	def current_weather
		STATE[rand(0..1)] # STATE.sample
	end


end
