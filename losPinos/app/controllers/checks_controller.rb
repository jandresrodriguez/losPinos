class ChecksController < ApplicationController

  def checkin
  	@reserva = Reserva.new
  	@reserva.build_cliente
  	
  end

  def reserva_params
    params.require(:reserva).permit(:name, cliente_attributes:[:name])
  end

  def checkout
  end
end
