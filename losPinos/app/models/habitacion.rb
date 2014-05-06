class Habitacion < ActiveRecord::Base

	validates :nombre, presence:true, uniqueness: true, allow_blank: false, allow_nil: false

	def to_s
		"#{nombre}"
	end

end
