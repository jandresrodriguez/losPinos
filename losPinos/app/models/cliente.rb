class Cliente < ActiveRecord::Base

	# Metodo to string
	def to_s
	  "#{nombre} #{apellido}"
	end

end
