class ReservasClientes < ActiveRecord::Base
  belongs_to :reserva
  belongs_to :cliente
end
