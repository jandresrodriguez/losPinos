class TipoReserva < ActiveRecord::Base

	def to_s
		"#{nombre}"
	end

end
