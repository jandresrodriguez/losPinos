class ChecksController < ApplicationController
  def checkin
  	@reserva = Reserva.new
  	@cliente = Cliente.new
  	@reserva.cliente = @cliente
  end

  def checkout
  end
end
