class Reserva < ActiveRecord::Base
  belongs_to :tipo_reserva
  belongs_to :cliente
  has_and_belongs_to_many :clientes
  belongs_to :habitacion

  accepts_nested_attributes_for :cliente
  accepts_nested_attributes_for :clientes

  # validates :monto, :moneda, presence: true

  validate :fechas_coherentes

  validates :fecha_inicio_estadia, presence: true, allow_blank: false
  validates :fecha_fin_estadia, presence: true, allow_blank: false
  validates :monto, presence: true, allow_blank: false
  validates :cliente, presence: true, allow_blank: false
  validates :habitacion, presence: true, allow_blank: false

  def fechas_coherentes
  	if fecha_inicio_estadia>=fecha_fin_estadia
  		errors.add(:base, 'error message')
  	end
  end

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