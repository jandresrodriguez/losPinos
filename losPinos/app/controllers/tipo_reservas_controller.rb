class TipoReservasController < ApplicationController
  before_action :set_tipo_reserva, only: [:show, :edit, :update, :destroy]

  # GET /tipo_reservas
  # GET /tipo_reservas.json
  def index
    @tipo_reservas = TipoReserva.all
  end

  # GET /tipo_reservas/1
  # GET /tipo_reservas/1.json
  def show
  end

  # GET /tipo_reservas/new
  def new
    @tipo_reserva = TipoReserva.new
  end

  # GET /tipo_reservas/1/edit
  def edit
  end

  # POST /tipo_reservas
  # POST /tipo_reservas.json
  def create
    @tipo_reserva = TipoReserva.new(tipo_reserva_params)

    respond_to do |format|
      if @tipo_reserva.save
        format.html { redirect_to @tipo_reserva, notice: 'Tipo reserva was successfully created.' }
        format.json { render action: 'show', status: :created, location: @tipo_reserva }
      else
        format.html { render action: 'new' }
        format.json { render json: @tipo_reserva.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tipo_reservas/1
  # PATCH/PUT /tipo_reservas/1.json
  def update
    respond_to do |format|
      if @tipo_reserva.update(tipo_reserva_params)
        format.html { redirect_to @tipo_reserva, notice: 'Tipo reserva was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @tipo_reserva.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tipo_reservas/1
  # DELETE /tipo_reservas/1.json
  def destroy
    @tipo_reserva.destroy
    respond_to do |format|
      format.html { redirect_to tipo_reservas_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tipo_reserva
      @tipo_reserva = TipoReserva.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def tipo_reserva_params
      params.require(:tipo_reserva).permit(:nombre, :habilitada, :comentarios)
    end
end
