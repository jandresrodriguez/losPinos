class Reserva < ActiveRecord::Base
  belongs_to :tipo_reserva
  belongs_to :cliente
  belongs_to :habitacion

  # validates :monto, :moneda, presence: true

end
