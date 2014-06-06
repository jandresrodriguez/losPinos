class StaticPagesController < ApplicationController

	def index

	end

	def ultimas
		@ultimas = Reserva.where(fecha_inicio_estadia: (DateTime.now-3).to_date.beginning_of_day()..(DateTime.now+15).to_date.beginning_of_day())
		.order(fecha_inicio_estadia: :desc)
		render json: @ultimas, include: [:cliente, :habitacion]
	end

	def home

		@disponibles = Habitacion.where(disponible: true).to_a

		@reservas_hoy = Reserva.where(fecha_inicio_estadia: ((DateTime.now).change(hour: 10, minutes: 0)..(DateTime.now+1).change(hour: 10, minutes: 0))).to_a
		habitaciones_id = Habitacion.select(:id)
		@habitaciones_disponibles = 0
		if !@reservas_hoy.empty?
			@reservas_hoy.each do |r|
				if habitaciones_id.include? r.habitacion
					@habitaciones_disponibles += 1
				end
			end
		end
		@reservas_semana = Reserva.where(fecha_inicio_estadia: (DateTime.now-7).to_date.beginning_of_day()..(DateTime.now+1).to_date.beginning_of_day()).to_a
		reservas_mes = Reserva.where(fecha_inicio_estadia: (DateTime.now-30).to_date.beginning_of_day()..(DateTime.now+1).to_date.beginning_of_day()).to_a
		@ventas_mes = 0
		if !reservas_mes.empty?
			reservas_mes.each do |reserva|
				if reserva.monto
					if reserva.moneda == "Peso"
						@ventas_mes+= (reserva.monto / 23)
					elsif reserva.moneda == "Euro"
						@ventas_mes+= (reserva.monto*1.37)
					else
						@ventas_mes+= reserva.monto
					end
				end
			end
		end
	end

	def action
		@date1 = Date.parse("1-#{params[:date][:Mes]}-#{params[:date][:Anio]}")
		@date31 = Date.parse("30-#{params[:date][:Mes]}-#{params[:date][:Anio]}")
		@reservas = Reserva.find(:all, :conditions => 'fecha_inicio_estadia > ' + @date1.to_s + ' AND 
			fecha_fin_estadia < ' + @date31.to_s )
		 respond_to do |format|
		   format.html { @reservas.length }
		   format.js { @reservas.length }
		 end
	end

	def control_habitaciones 

	end

end
