class ChecksController < ApplicationController

  def checkin
  	@reserva = Reserva.new
  	@reserva.build_cliente
  end

  def checkout
  end
end
