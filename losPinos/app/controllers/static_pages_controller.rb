class StaticPagesController < ApplicationController

	def index

	end

	def home
		@disponibles = Habitacion.where(disponible: true).to_a
		#@disponibles = Reserva.joins(:habitacion)
	end

	def action
		puts "1-#{params[:date][:Mes]}-#{params[:date][:Anio]}"
		@date1 = Date.parse("1-#{params[:date][:Mes]}-#{params[:date][:Anio]}")
		@date31 = Date.parse("30-#{params[:date][:Mes]}-#{params[:date][:Anio]}")
		puts "vaaa #{@date1}"
		puts "vaaa #{@date31}"
		@reservas = Reserva.find(:all, :conditions => 'fecha_inicio_estadia > ' + @date1.to_s + ' AND 
			fecha_fin_estadia < ' + @date31.to_s )
		puts "vaaa #{@reservas.length}"
		 respond_to do |format|
		   format.html { @reservas.length }
		   format.js { @reservas.length }
		 end
	end


end
