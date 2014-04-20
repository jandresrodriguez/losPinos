class Reserva < ActiveRecord::Base
  belongs_to :tipo_reserva
  belongs_to :cliente
  belongs_to :habitacion

  accepts_nested_attributes_for :cliente

  # validates :monto, :moneda, presence: true

  validates :fecha_inicio_estadia, presence: true
  validates :fecha_fin_estadia, presence: true
  validates :cliente, presence: true
  validates :habitacion, presence: true

end

# Validaciones
class ReservaValidate < ActiveModel::Validator

	def initialize(reserva)
		@reserva = reserva
	end

	def validate
		# Validacion para que la reserva sea correcta
		(@reserva.fecha_inicio_estadia .. @reserva.fecha_fin_estadia).each do |fecha|
			# Recorro las fechas del rango marcado y controlo si hay alguna reserva para el mismo
			if Reserva.where("fecha_inicio_estadia <= ? & fecha_fin_estadia >= ? & habitacion_id == ?", fecha, fecha, @reserva.habitacion).exists?
				@reserva.errors[:base] << "La habitacion esta ocupada."
				return # Retorno porque no hay que seguir si encontre error
			end
		end
	end

end