class Cliente < ActiveRecord::Base
	has_many :reservas

	accepts_nested_attributes_for :reservas
	
	# Metodo to string
	def to_s
	  "#{nombre} #{apellido}"
	end

end
