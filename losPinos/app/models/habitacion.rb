class Habitacion < ActiveRecord::Base

	validates :nombre, presence: true, allow_blank: false

	def to_s
		"#{nombre}"
	end

end
