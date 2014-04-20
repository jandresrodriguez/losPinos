class ChecksController < ApplicationController

  def checkin
  	@reserva = Reserva.new
  	@reserva.build_cliente
  	@ultimas = Reserva.where(fecha_inicio_estadia: [(DateTime.now-3).to_date, 
      DateTime.now.to_date]).order(fecha_inicio_estadia: :desc)
  end

  def checkout
  end
end
