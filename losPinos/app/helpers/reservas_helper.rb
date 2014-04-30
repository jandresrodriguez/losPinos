module ReservasHelper
	def addclient_path(reserva)
	    "/reservas/#{reserva.id}/agregar_acompaniante"
	end
end
