class Cliente < ActiveRecord::Base
	has_many :reservas


	#VALIDACIONES

	validates :nombre, presence: true, allow_blank: false
	validates :apellido, presence: true, allow_blank: false
	validates :fecha_nac, presence: true, allow_blank: false
	validates :nacionalidad, presence: true, allow_blank: false
	validates :documento, uniqueness: true, presence: true, allow_blank: false
	validates :documento_tipo, presence: true, allow_blank: false
	validates :email, presence: true, allow_blank: false, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
	

	# Metodo to string
	def to_s
	  "#{nombre} #{apellido}"
	end

end
