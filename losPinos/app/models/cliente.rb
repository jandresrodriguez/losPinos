class Cliente < ActiveRecord::Base
	has_many :reservas


	#VALIDACIONES

	validates :nombre, presence: true
	validates :apellido, presence: true
	validates :fecha_nac, presence: true
	validates :nacionalidad, presence: true
	validates :documento, presence: true
	validates :documento_tipo, presence: true
	validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
	

	# Metodo to string
	def to_s
	  "#{nombre} #{apellido}"
	end

end
