class TipoReserva < ActiveRecord::Base

	def to_s
		"#{nombre}"
	end

	def self.habilitadas # Metodo de clase
		
		# Recorro todos los tipos de reservas y si esta habilitada la retorno
		tipos_reservas = []
    TipoReserva.all.each do |ts|
    	if (ts.habilitada)
      	tipos_reservas.push([ts.nombre, ts.id])
      end
    end
		return tipos_reservas
	end

end
