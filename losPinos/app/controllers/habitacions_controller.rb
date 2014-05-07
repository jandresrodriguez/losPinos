class HabitacionsController < ApplicationController
  before_action :set_habitacion, only: [:show, :edit, :update, :destroy]

  # GET /habitacions
  # GET /habitacions.json
  def index
    @habitacions = Habitacion.all
  end

  # GET /habitacions/1
  # GET /habitacions/1.json
  def show
  end

  # GET /habitacions/new
  def new
    @habitacion = Habitacion.new
  end

  # GET /habitacions/1/edit
  def edit
  end

  # POST /habitacions
  # POST /habitacions.json
  def create
    @habitacion = Habitacion.new(habitacion_params)

    respond_to do |format|
      if @habitacion.save
        format.html { redirect_to habitacions_path, notice: 'Habitacion creada con exito.' }
        format.json { render action: 'show', status: :created, location: @habitacion }
      else
        format.html { render action: 'new' }
        format.json { render json: @habitacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /habitacions/1
  # PATCH/PUT /habitacions/1.json
  def update
    respond_to do |format|
      if @habitacion.update(habitacion_params)
        format.html { redirect_to habitacions_path, notice: 'Habitacion modificada con exito.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @habitacion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /habitacions/1
  # DELETE /habitacions/1.json
  def destroy
    @habitacion.destroy
    respond_to do |format|
      format.html { redirect_to habitacions_url }
      format.json { head :no_content }
    end
  end

  def habitaciones_estado
    @diaReferencia = Date.today + (params[:cantidad].to_i * 7)
    @dias = []
    @habitaciones_estado = []
    @diaInicioSemana = @diaReferencia.beginning_of_week
    @diaFinSemana = @diaReferencia.end_of_week

    # Primero cargo la lista de dias
    (@diaInicioSemana .. @diaFinSemana).each do |fecha|
      @dias.push({dia: fecha})
    end

    # Para cada habitacion disponible recorro los dias y controlo su estado
    Habitacion.where(disponible: true).each do |habitacion|
      
      @dias_estado = []
      (@diaInicioSemana .. @diaFinSemana).each do |fecha|

        @libre = true
        if Reserva.where(habitacion: habitacion).where("fecha_inicio_estadia <= ? and fecha_fin_estadia >= ?", fecha, fecha).exists?
          @libre = false
        end
        @dias_estado.push({dia: fecha, libre: @libre})

      end
      
      @habitaciones_estado.push({habitacion: habitacion, dias_estado: @dias_estado})
    end

    @lista = {dias: @dias, habitaciones_estado:@habitaciones_estado}
    render json: @lista
    
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_habitacion
      @habitacion = Habitacion.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def habitacion_params
      params.require(:habitacion).permit(:nombre, :descripcion, :disponible, :comentarios, :nro_camas_single, :nro_camas_matrimoniales)
    end
end
