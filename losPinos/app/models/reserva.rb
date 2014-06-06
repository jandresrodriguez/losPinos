class Reserva < ActiveRecord::Base
  belongs_to :tipo_reserva
  belongs_to :cliente
  has_and_belongs_to_many :clientes
  belongs_to :habitacion

  
  accepts_nested_attributes_for :cliente
  accepts_nested_attributes_for :clientes

  validate :fechas_coherentes
  validate :room_isnt_occupied_create, :on => :create
  validate :room_isnt_occupied_update, :on => :update

  validates :fecha_inicio_estadia, presence: true, allow_blank: false
  validates :fecha_fin_estadia, presence: true, allow_blank: false
  validates :monto, presence: true, allow_blank: false
  validates :tipo_reserva, presence: true, allow_blank: false
  validates :cliente, presence: true, allow_blank: false
  validates :habitacion, presence: true, allow_blank: false

  
  def room_isnt_occupied_create
    (fecha_inicio_estadia.to_date .. fecha_fin_estadia.to_date).each do |fecha|
      # Recorro las fechas del rango marcado y controlo si hay alguna reserva para el mismo
      if Reserva.where("date(fecha_inicio_estadia) <= ? and date(fecha_fin_estadia) >= ? and habitacion_id = ?",
       fecha.to_date, fecha.to_date, habitacion).exists?
        if !errors[:base].include? "La habitacion esta ocupada."
          errors[:base] << "La habitacion esta ocupada."
        end
      # return # Retorno porque no hay que seguir si encontre error
      end
    end
  end


  def room_isnt_occupied_update
    (fecha_inicio_estadia.to_date .. fecha_fin_estadia.to_date).each do |fecha|
      # Recorro las fechas del rango marcado y controlo si hay alguna reserva para el mismo
      if Reserva.where("date(fecha_inicio_estadia) <= ? and date(fecha_fin_estadia) >= ? and habitacion_id = ? and id <> ?",
       fecha.to_date, fecha.to_date, habitacion, id).exists?
        if !errors[:base].include? "La habitacion esta ocupada."
          errors[:base] << "La habitacion esta ocupada."
        end
      # return # Retorno porque no hay que seguir si encontre error
      end
    end
  end

  #validate do |reserva|
   # ReservaValidate.new(reserva).validate
  #end

  def fechas_coherentes
    puts "ENTRO AL VALIDATEEEEEEEEEEEEEEEEEEEEEEEE FECHAAAAAAAAAAAAA"
  	if fecha_inicio_estadia>=fecha_fin_estadia
  		errors[:base] << "La fecha de fin no puede ser antes que la de inicio."
  	end
  end

end

# Validaciones
class ReservaValidate < ActiveModel::Validator

	def initialize(reserva)
		@reserva = reserva
	end

	def validate
    puts "ENTRO AL VALIDATEEEEEEEEEEEEEEEEEEEEEEEE"
    puts "ENTRO AL VALIDATEEEEEEEEEEEEEEEEEEEEEEEE"
    puts "ENTRO AL VALIDATEEEEEEEEEEEEEEEEEEEEEEEE"
		# Validacion para que la reserva sea correcta
		(@reserva.fecha_inicio_estadia.to_date .. @reserva.fecha_fin_estadia.to_date).each do |fecha|
			# Recorro las fechas del rango marcado y controlo si hay alguna reserva para el mismo
			if Reserva.where("date(fecha_inicio_estadia) <= ? and date(fecha_fin_estadia) >= ? and habitacion_id = ? and id <> ?",
       fecha.to_date, fecha.to_date, @reserva.habitacion, @reserva.id).exists?
				@reserva.errors[:base] << "La habitacion esta ocupada."
			#	return # Retorno porque no hay que seguir si encontre error
			end
		end
	end

end