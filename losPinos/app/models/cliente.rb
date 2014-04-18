class Cliente < ActiveRecord::Base
	has_many :reservas

	
	
	# Metodo to string
	def to_s
	  "#{nombre} #{apellido}"
	end

end
